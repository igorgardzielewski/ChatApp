//
//  AuthView.swift
//  chat
//
//  Created by Igor Gardzielewski on 01/04/2024.
//

import SwiftUI
import FirebaseAuth
import Firebase
struct AuthView: View {
    @State private var currentViewShowing: String = "login" // login or signup
    var body: some View {
        if(currentViewShowing == "login") {
            LoginView(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.light)
        } else {
            SignupView(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.dark)
                .transition(.move(edge: .bottom))
        }
  
    }
}


#Preview {
    AuthView()
}
