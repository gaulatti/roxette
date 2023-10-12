//
//  MenuView.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/11/23.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var globalState: GlobalStateViewModel
    @Binding var currentView: ViewsEnum

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                LogoComponent().padding(.top).foregroundColor(Color.menuPurple)
                Spacer()
                Rectangle()
                    .foregroundColor(.menuPurple)
                    .frame(width: 120, height: 120)
                    .cornerRadius(15)
                    .padding(.bottom)

                MenuButtonComponent(label: "Home", view: .home, currentView: currentView) {
                    self.currentView = .home
                    self.globalState.currentSidebar = .none
                }
                MenuButtonComponent(label: "Player Prototype", view: .player, currentView: currentView) {
                    self.currentView = .player
                    self.globalState.currentSidebar = .none
                }
                MenuButtonComponent(label: "XHR Prototype", view: .xhr, currentView: currentView) {
                    self.currentView = .xhr
                    self.globalState.currentSidebar = .none
                }

                Spacer()
            }.frame(width: UIScreen.main.bounds.width * 0.7)
            Spacer()
        }
        .background(Color.menuBackground)
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct MenuView_Previews: PreviewProvider {
    @State static var currentView: ViewsEnum = .home

    static var previews: some View {
        MenuView(currentView: $currentView)
            .environmentObject(GlobalStateViewModel.shared)
    }
}
