//
//  ContentView.swift
//  chat
//
//  Created by Igor Gardzielewski on 13/03/2024.
//

import SwiftUI
import FirebaseFirestore
struct ContentView: View {
    @ObservedObject private var viewModel = UsersViewModel()
    @AppStorage("uid") var userID: String = ""
    @ObservedObject private var FriendsModel = UsersFriendsViewModel()
    @Binding var presentSideMenu: Bool
    @State private var filter_text=""
    @State private var chat_okno: Bool = false
    @State private var isShowingNewPage = false
    @State private var me: Me?
    var body: some View {
            VStack(alignment:.leading) {
                HStack{
                    Button{
                        presentSideMenu.toggle()
                    }label:{
                        Image("more")
                            .resizable()
                            .frame(width: 32,height: 32)
                    }
                    .padding(.all)
                    TextField("filter", text: $filter_text)
                        .textInputAutocapitalization(.never)
                        .padding(.all)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.gray.opacity(0.5), lineWidth: 2)
                        )
                        .padding(.trailing)
                }
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack{
                        ForEach(FriendsModel.users) { index in
                                user(photo: "user_photo",
                                     text: index.name)
                                .padding(.top)
                                .padding(.leading)
                                .padding(.trailing)
                        }
                    }
                    Divider()
                }
                .background(Color.gray.opacity(0.1))
                Spacer()
                ScrollView(showsIndicators:false) {
                    ForEach(0..<10) { _ in
                                        Button(action: {
                                            isShowingNewPage.toggle() // Po kliknięciu przycisku zmieniamy stan, aby wyświetlić nową stronę
                                            chat_okno.toggle()
                                        }) {
                                            thread(username: "Igor Gardzielewski", img: "person", thread_name: "Watek")
                                                .foregroundColor(.black)
                                        }
                                    }
                              }
                Spacer()
            }
            .ignoresSafeArea(.all)
            .padding(.top)
            .sheet(isPresented: $isShowingNewPage) {
                        chat_view()
            }
            .onAppear() {
                if self.me == nil {
                     fetchUser(byUID: userID) { user in
                         self.me = user
                         FriendsModel.fetchUserData(uids: user?.friends ?? [])
                     }
                 }
            
            }

        }
}
struct thread: View {
    let username: String
    let img: String
    let thread_name: String
    var body: some View {
        HStack {
            Image(systemName:img)
                .frame(width: 64,height: 64)
                .overlay(
                    RoundedRectangle(cornerRadius: 64)
                        .stroke(
                            lineWidth: 2.0))
                .padding(.trailing)
            VStack(alignment: .leading)
            {
                Text(thread_name)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(username)
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 40,alignment: .leading)
        .padding(.all)
        Divider()
    }
}
struct user: View {
    let photo : String
    let text : String
    var body: some View {
        VStack{
            Image(photo)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 64, height: 64)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(.gray.opacity(0.5), lineWidth: 10)
                )
                .cornerRadius(50)
            Text(text)
                .font(.system(size: 18, weight: .semibold))
        }
    }
}
