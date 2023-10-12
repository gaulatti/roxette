//
//  PlaylistQueueComponent.swift
//  roxette
//
//  Created by jgodoynunez on 10/12/23.
//

import SwiftUI


struct PlaylistQueueComponent: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .foregroundStyle(
                Color.menuPurple.gradient.shadow(.inner(color: .black.opacity(0.5), radius: 40, x: 1, y: 1))
            )
            .overlay(
                ScrollView {
                    VStack {
                        PlaylistSongComponent()
                        PlaylistSongComponent()
                        PlaylistSongComponent()
                        PlaylistSongComponent()
                        PlaylistSongComponent()
                        PlaylistSongComponent()
                        PlaylistSongComponent()
                        PlaylistSongComponent()
                        PlaylistSongComponent()
                    }.padding()
                }
            )
    }
}
