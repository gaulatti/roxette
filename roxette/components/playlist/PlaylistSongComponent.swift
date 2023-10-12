//
//  PlaylistSongComponent.swift
//  roxette
//
//  Created by jgodoynunez on 10/12/23.
//

import SwiftUI

struct PlaylistSongComponent: View {
    var body: some View {
        HStack {
            VStack {
                Text("Russia calls Israeli missile strikes on Syria \"gross violation\" of international law").font(Font.custom("RNSSanz-Medium", size: 16)).foregroundColor(.white)
            }
            Spacer()
            Button(action: { }) {
                Image(systemName: "play.circle.fill").frame(height: 32).foregroundColor(.white)
            }
            Button(action: { }) {
                Image(systemName: "minus.circle.fill").frame(height: 32).foregroundColor(.white)
            }
        }
        
    }
}
