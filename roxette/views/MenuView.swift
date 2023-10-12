//
//  MenuView.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/11/23.
//

import SwiftUI

struct MenuView: View {
    @Binding var showMenu: Bool
    @Binding var currentView: ViewsEnum
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Spacer()
                Rectangle()
                    .foregroundColor(.menuPurple)
                    .frame(width: 120, height: 120)
                    .cornerRadius(15)
                    .padding(.bottom)

                ButtonComponent(label: "Home", view: .home, currentView: currentView) {
                    self.currentView = .home
                    self.showMenu.toggle()
                }
                ButtonComponent(label: "Player Prototype", view: .player, currentView: currentView) {
                    self.currentView = .player
                    self.showMenu.toggle()
                }
                ButtonComponent(label: "XHR Prototype", view: .xhr, currentView: currentView) {
                    self.currentView = .xhr
                    self.showMenu.toggle()
                }

                Spacer()
            }.frame(width: UIScreen.main.bounds.width * 0.7)
            Spacer()
        }
        .background(Color.menuBackground)
        .frame(width: UIScreen.main.bounds.width)
    }
}

