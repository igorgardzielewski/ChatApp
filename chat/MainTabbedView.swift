//
//  MainTabbedView.swift
//  chat
//
//  Created by Igor Gardzielewski on 16/03/2024.
//

import SwiftUI

struct MainTabbedView: View {
    
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    @State var filtr_text = ""
    var body: some View {
        ZStack{
            if selectedSideMenuTab == 0
            {
                ContentView(presentSideMenu: $presentSideMenu,filter_text: $filtr_text)
            }
            if selectedSideMenuTab == 1
            {
                Profile(presentSideMenu: $presentSideMenu)
            }
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
        }
    }
}
#Preview {
    MainTabbedView()
}
