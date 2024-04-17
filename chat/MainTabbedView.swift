//
//  MainTabbedView.swift
//  chat
//
//  Created by Igor Gardzielewski on 16/03/2024.
//

import SwiftUI

struct MainTabbedView: View {
    @State private var logged = true
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    var body: some View {
        ZStack{
            if selectedSideMenuTab == 0
            {
                ContentView(presentSideMenu: $presentSideMenu)
            }
            if selectedSideMenuTab == 1
            {
                Profile(presentSideMenu: $presentSideMenu)
                    .transition(.move(edge: .bottom))
            }
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))

        }
    }
}
#Preview {
    MainTabbedView()
}
