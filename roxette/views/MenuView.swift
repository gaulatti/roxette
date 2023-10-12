//
//  MenuView.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/11/23.
//

import SwiftUI

struct MenuView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Spacer()
                ButtonComponent(label: "Player Prototype") {
                    self.showMenu.toggle()
                }
                ButtonComponent(label: "XHR Prototype") {
                    self.showMenu.toggle()
                }
                Spacer()
                ButtonComponent(label: "Log Out") {
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

