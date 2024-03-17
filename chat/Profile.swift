//
//  Profile.swift
//  chat
//
//  Created by Igor Gardzielewski on 16/03/2024.
//

import SwiftUI
struct Profile: View {
    
    @Binding var presentSideMenu: Bool
    
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
            Spacer()
        }
        .ignoresSafeArea(.all)
        .padding()
    }
}
