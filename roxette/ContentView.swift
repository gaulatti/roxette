//
//  ContentView.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/10/23.
//

import AVKit
import SwiftData
import SwiftUI

struct ContentView: View {
  @StateObject private var player = PlayerViewModel()
  @State private var wasPlayingBeforeDrag: Bool = false
  @State private var isDragging: Bool = false

  var body: some View {
    VStack {
      Text(player.currentTitle)
        .font(.headline)
        .padding()

      Button(action: player.play) {
        Image(systemName: "play.circle.fill")
          .resizable()
          .frame(width: 50, height: 50)
      }

      Button(action: player.pause) {
        Image(systemName: "pause.circle.fill")
          .resizable()
          .frame(width: 50, height: 50)
      }

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
        .onChange(
          of: player.currentTime,
          perform: { value in
            if isDragging {
              player.seek(to: value)
            }
          })
      }
    }
    .padding()
  }
}

#Preview {
  ContentView()
    .modelContainer(for: Item.self, inMemory: true)
}
