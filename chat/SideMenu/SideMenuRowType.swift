//
//  SideMenuRowType.swift
//  chat
//
//  Created by Igor Gardzielewski on 16/03/2024.
//

import Foundation
enum SideMenuRowType: Int, CaseIterable{
    case home = 0
    case profile
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .profile:
            return "Profile"
        }
    }
    var iconName: String{
        switch self {
        case .home:
            return "house"
        case .profile:
            return "person"
        }
    }
}
