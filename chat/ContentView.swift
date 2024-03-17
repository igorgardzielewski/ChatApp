//
//  ContentView.swift
//  chat
//
//  Created by Igor Gardzielewski on 13/03/2024.
//

import SwiftUI

struct ContentView: View {
    @Binding var presentSideMenu: Bool
    @Binding var filter_text: String
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
                        ForEach(0..<10) { index in
                            user(photo: "user_photo",
                                 text: "Igor")
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
                        thread(username: "Igor Gardzielewski", img: "person", thread_name: "Projekt KCK")
                    }
                }
                Spacer()
        }
        .ignoresSafeArea(.all)
        .padding(.top)
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
