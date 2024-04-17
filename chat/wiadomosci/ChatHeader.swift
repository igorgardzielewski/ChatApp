//
//  ChatHeader.swift
//  chat
//
//  Created by Igor Gardzielewski on 23/03/2024.
//

import SwiftUI

struct ChatHeader: View {
//    var photo:String
//    var username: String
    var body: some View {
        VStack
        {
            HStack()
            {
                Image("user_photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 80,height: 80)
                Text("user")
                    .font(.system(size:30,
                                  weight: .semibold))
                    .padding(.trailing)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color.blue.opacity(0.3))
            .ignoresSafeArea(.all)
        }

    }
}

#Preview {
    ChatHeader()
}
