//
//  HeaderComponent.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/11/23.
//

import SwiftUI

struct HeaderComponent: View {
    @Binding var showMenu: Bool
    @Binding var showPlaylist: Bool
    @State private var showingAlert = false

    var body: some View {
            HStack {
                Button(action: {
                    withAnimation {
                        showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                }
                Spacer()
                RoxetteComponent().foregroundStyle(Color.black)
                Spacer()
                Button(action: {
                    withAnimation {
                        showPlaylist.toggle()
                    }
                }) {
                    Image(systemName: "headphones")
                }
            }.padding()
            
    }
}

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        @State var showMenu = false
        @State var showPlaylist = false
        HeaderComponent(showMenu: $showMenu, showPlaylist: $showPlaylist)
    }
}

