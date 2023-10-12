//
//  PlayerView.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/11/23.
//

import Foundation
import AVKit
import SwiftData
import SwiftUI

struct PlayerView: View {
  @StateObject private var player = PlayerViewModel()
  @State private var wasPlayingBeforeDrag: Bool = false
  @State private var isDragging: Bool = false

  var body: some View {
    VStack {
      Text(player.currentTitle)
        .font(.headline)
        .padding()

      HStack {
        Button(action: {
          if player.isPlaying {
            player.pause()
          } else {
            player.play()
          }
        }) {
          Image(systemName: player.isPlaying ? "pause.circle.fill" : "play.circle.fill")
            .resizable()
            .frame(width: 50, height: 50)
        }.padding()

        if player.duration > 0 {
          Slider(
            value: $player.currentTime, in: 0...player.duration, step: 1,
            onEditingChanged: { editing in

              isDragging = editing
              if editing {
                wasPlayingBeforeDrag = player.isPlaying
                player.pause()
              } else if wasPlayingBeforeDrag {
                player.play()
              }
            }
          ) {
            Text("Progress")
          }
          .padding()
          .onChange(of: player.currentTime) { (oldValue, newValue) in
            if isDragging {
              player.seek(to: newValue)
            }
          }

        }
      }
    }
    .padding()
  }
}

#Preview {
  PlayerView()
    .modelContainer(for: Item.self, inMemory: true)
}
