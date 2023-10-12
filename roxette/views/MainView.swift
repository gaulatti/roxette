//
//  ContentView.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/11/23.
//

import SwiftUI

struct MainView: View {
    @Binding var showMenu: Bool
    @Binding var currentView: ViewsEnum
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                HeaderComponent(showMenu: $showMenu)
                switch currentView {
                case .player:
                    PlayerView()
                case .xhr:
                    XhrView()
                case .home:
                   Text("This is just the home. Check the menu for more things.").foregroundStyle(Color.black)
                }
                Spacer()
            }.blur(radius: showMenu ? 3 : 0)
        }
        .frame(
            minWidth: UIScreen.main.bounds.width
        )
        .background(Color.white)
        .cornerRadius(10)
        .shadow(
            color: showMenu ? .menuContentShadow : .white,
            radius: showMenu ? 5 : 0
        )
        .scaleEffect(showMenu ? 0.8 : 1)
        .offset(x: showMenu ? UIScreen.main.bounds.width * 0.6 : 0)
    }
}

