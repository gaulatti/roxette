//
//  ContentView.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/11/23.
//

import SwiftUI

struct MainView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Spacer()
                PlayerView()
                
                Button("Toggle Menu") {
                    withAnimation {
                        self.showMenu.toggle()
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

