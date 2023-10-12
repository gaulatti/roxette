//
//  ContentView.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/11/23.
//

import SwiftUI

struct MainView: View {
    @Binding var showMenu: Bool
    @Binding var showPlaylist: Bool
    @Binding var currentView: ViewsEnum
    
    var hideMain: Bool {
        return showMenu || showPlaylist
    }
    
    var xOffset: CGFloat {
        if showMenu {
            return UIScreen.main.bounds.width * 0.6
        } else if showPlaylist {
            return -(UIScreen.main.bounds.width * 0.6)
        } else {
            return 0
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                HeaderComponent(showMenu: $showMenu, showPlaylist: $showPlaylist)
                switch currentView {
                case .player:
                    PlayerView()
                case .xhr:
                    XhrView()
                case .home:
                   Text("This is just the home. Check the menu for more things.").foregroundStyle(Color.black)
                }
                Spacer()
            }.blur(radius: hideMain ? 3 : 0)
        }
        .frame(
            minWidth: UIScreen.main.bounds.width
        )
        .background(Color.white)
        .cornerRadius(10)
        .shadow(
            color: hideMain ? .menuContentShadow : .white,
            radius: hideMain ? 5 : 0
        )
        .scaleEffect(hideMain ? 0.8 : 1)
        .offset(x: xOffset)
    }
}

