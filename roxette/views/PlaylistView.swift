//
//  PlaylistView.swift
//  roxette
//
//  Created by jgodoynunez on 10/12/23.
//

import SwiftUI

struct PlaylistView: View {
    @EnvironmentObject var globalState: GlobalStateViewModel

    var body: some View {
        HStack(alignment: .top) {
            Button(action: {
                withAnimation {
                    globalState.currentSidebar = .none
                }
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
                .frame(height: 60)
                .padding()
            }
            Spacer()
            VStack(alignment: .trailing) {
                LogoComponent()
                    .padding(.top)
                    .foregroundColor(Color.menuPurple)
                    .frame(width: UIScreen.main.bounds.width * 0.7)
                NowPlayingComponent()
                PlaylistQueueComponent().padding(.horizontal)
                PlaybackControlsComponent()
                Spacer()
            }.frame(width: UIScreen.main.bounds.width * 0.7)
        }
        .background(Color.menuBackground)
        .frame(width: UIScreen.main.bounds.width)
    }
}

#Preview {
    PlaylistView()
        .modelContainer(for: Item.self, inMemory: true)
        .environmentObject(GlobalStateViewModel.shared)
}
