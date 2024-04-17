//
//  Auth-HomeView.swift
//  chat
//
//  Created by Igor Gardzielewski on 01/04/2024.
//

import SwiftUI
import Firebase
struct Auth_HomeView: View {
    @AppStorage("uid") var userID: String = ""
    var body: some View {
            if userID == "" {
                AuthView()
            }
            else
            {
                MainTabbedView()
                .transition(.move(edge: .bottom))

            }
        }
}

#Preview {
    Auth_HomeView()
}
