//
//  chatApp.swift
//  chat
//
//  Created by Igor Gardzielewski on 13/03/2024.
//

import SwiftUI
import FirebaseCore
@main
struct chatApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
           Auth_HomeView()
        }
    }
}
