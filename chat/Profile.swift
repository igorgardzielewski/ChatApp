//
//  Profile.swift
//  chat
//
//  Created by Igor Gardzielewski on 16/03/2024.
//

import SwiftUI
import FirebaseAuth
struct Profile: View {
    
    @Binding var presentSideMenu: Bool
    @AppStorage("uid") var userID: String = ""
    var body: some View {
        VStack{
            HStack(alignment:.top){
                Button{
                    presentSideMenu.toggle()
                }label:{
                    Image("more")
                        .resizable()
                        .frame(width: 32,height: 32)
                }
                .padding(.all)
                Spacer()
            }
            Spacer()
            Text("Profile")
            Button(action: {
                           let firebaseAuth = Auth.auth()
                           do {
                               try firebaseAuth.signOut()
                               withAnimation {
                                   userID = ""
                               }
                           } catch let signOutError as NSError {
                               print("Error signing out: %@", signOutError)
                           }
                       }) {
                           Text("Sign Out")
                       }
            Spacer()
        }
        .ignoresSafeArea(.all)
        .padding()
    }
}
