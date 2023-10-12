//
//  ContentView.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/11/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var globalState: GlobalStateViewModel
    @Binding var currentView: ViewsEnum

    var xOffset: CGFloat {
        if globalState.currentSidebar == .menu {
            return UIScreen.main.bounds.width * 0.6
        } else if globalState.currentSidebar == .playlist {
            return -(UIScreen.main.bounds.width * 0.6)
        } else {
            return 0
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                HeaderComponent()
                switch currentView {
                case .player:
                    PlayerView()
                case .xhr:
                    XhrView()
                case .home:
                   Text("This is just the home. Check the menu for more things.").foregroundStyle(Color.black)
                }
                Spacer()
            }.blur(radius: globalState.isAnySidebarOpen() ? 3 : 0)
        }
        .frame(
            minWidth: UIScreen.main.bounds.width
        )
        .background(Color.white)
        .cornerRadius(10)
        .shadow(
            color: globalState.isAnySidebarOpen() ? .menuContentShadow : .white,
            radius: globalState.isAnySidebarOpen() ? 5 : 0
        )
        .scaleEffect(globalState.isAnySidebarOpen() ? 0.8 : 1)
        .offset(x: xOffset)
    }
}

