//
//  Users.swift
//  chat
//
//  Created by Igor Gardzielewski on 10/04/2024.
//

import Foundation
import Firebase
import FirebaseFirestore
struct Me: Identifiable {
    var id: String
    var name: String
    var friends: [String]
}
struct User: Identifiable
{
    var id: String
    var name: String
}
class UsersViewModel: ObservableObject {
    @Published var users = [User]()
    private var db = Firestore.firestore()
    func fetchData() {
        db.collection("users").getDocuments { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.users = documents.map { (queryDocumentSnapshot) -> User in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID
                let name = data["full_name"] as? String ?? ""
                return User(id: id, name: name)
            }
        }
    }
}
func fetchUser(byUID uid: String, completion: @escaping (Me?) -> Void) {
    let db = Firestore.firestore()
    db.collection("users").document(uid).getDocument { (document, error) in
        guard let document = document, document.exists, let data = document.data() else {
            print("Nie można znaleźć użytkownika: \(error?.localizedDescription ?? "nieznany błąd")")
            completion(nil)
            return
        }
        let id = document.documentID
        let name = data["name"] as? String ?? ""
        let friends = data["friends_uids"] as? [String] ?? []
        let user = Me(id: id, name: name, friends: friends)
        completion(user)
    }
}
class UsersFriendsViewModel: ObservableObject {
    @Published var users = [User]()
    func fetchFriendsData(friendsUIDs: [String]) {
        let db = Firestore.firestore()
        var friends: [User] = []
        
        let group = DispatchGroup()
        
        for uid in friendsUIDs {
            group.enter()
            db.collection("users").document(uid).getDocument { (document, error) in
                if let document = document, document.exists, let userData = document.data() {
                    let user = User(id: document.documentID,
                                    name: userData["full_name"] as? String ?? "")
                    friends.append(user)
                } else {
                    print("Nie można znaleźć dokumentu znajomego lub wystąpił błąd: \(error?.localizedDescription ?? "")")
                }
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.users = friends
        }
    }

    // Funkcja pomocnicza do inicjowania pobierania danych
    func fetchUserData(uids: [String]) {
        fetchFriendsData(friendsUIDs: uids)
    }
}
