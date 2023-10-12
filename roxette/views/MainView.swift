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
                switch currentView {
                case .player:
                    PlayerView()
                    Button("Toggle Menu") {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    }
                case .xhr:
                    XhrView() // Assuming you have a view named XHRView
                    Button("Toggle Menu") {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    }
                case .home:
                    Spacer()
                    Button("Toggle Menu") {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    }
                }
                Spacer()
            }.blur(radius: showMenu ? 10 : 0)
        }
        .frame(
            minWidth: UIScreen.main.bounds.width,
            minHeight: UIScreen.main.bounds.height
        )
        .background(Color.white)
        .cornerRadius(10)
        .shadow(
            color: .menuContentShadow,
            radius: showMenu ? 30: 0
        )
        .scaleEffect(showMenu ? 0.8 : 1)
        .offset(x: showMenu ? UIScreen.main.bounds.width * 0.6 : 0)
    }
}

