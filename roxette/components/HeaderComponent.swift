//
//  HeaderComponent.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/11/23.
//

import SwiftUI

struct HeaderComponent: View {
    @EnvironmentObject var globalState: GlobalStateViewModel
    @State private var showingAlert = false

    var body: some View {
            HStack {
                Button(action: {
                    withAnimation {
                        globalState.currentSidebar = .menu
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                }
                Spacer()
                RoxetteComponent().foregroundStyle(Color.black)
                Spacer()
                Button(action: {
                    withAnimation {
                        globalState.currentSidebar = .playlist
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
        HeaderComponent()
            .environmentObject(GlobalStateViewModel.shared)
    }
}

