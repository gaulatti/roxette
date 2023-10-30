//
//  ControlsComponent.swift
//  roxette
//
//  Created by jgodoynunez on 10/12/23.
//

import SwiftUI

struct PlaybackControlsComponent: View {
    @EnvironmentObject var player: PlayerViewModel
    @State private var wasPlayingBeforeDrag: Bool = false
    @State private var isDragging: Bool = false
    @State private var total: Double = 45.0
    
    var body: some View {
        VStack {
            PlaybackActionsComponent()
            HStack {
                Button(action: { }) {
                    Image(systemName: "gobackward.15").frame(height: 32)
                }
                Spacer()
                Slider(value: $total, in: 0...300, step: 1)
                Spacer()
                Button(action: { }) {
                    Image(systemName: "goforward.15").frame(height: 32)
                }
            }.padding(.horizontal)
            HStack {
                Text("0:17").font(.menuItem)
                Spacer()
                Text(player.timeString(from: player.duration)).font(.menuItem)
            }.padding(.horizontal)
            HStack {
                Spacer()
                Button(action: { }) {
                    Image(systemName: "backward.fill").frame(height: 32).font(.system(size: 32))
                }.padding(.trailing)
                Button(action: {
                    if player.isPlaying {
                        player.pause()
                    } else {
                        player.play()
                    }
                }) {
                    Image(systemName: player.isPlaying ? "pause.circle.fill" : "play.circle.fill").frame(height: 32).font(.system(size: 32))
                }.padding(.trailing)
                Button(action: { }) {
                    Image(systemName: "forward.fill").frame(height: 32).font(.system(size: 32))
                }
                Spacer()
            }
        }
    }
}

struct PlaybackControlsComponent_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackControlsComponent()
            .environmentObject(PlayerViewModel.shared)
    }
}


