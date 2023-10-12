//
//  PlaybackActionsComponent.swift
//  roxette
//
//  Created by jgodoynunez on 10/12/23.
//

import SwiftUI

struct PlaybackActionsComponent: View {
    var body: some View {
        HStack{
            Button(action: { }) {
                Image(systemName: "heart").frame(height: 32)
            }
            Spacer()
            Button(action: { }) {
                Image(systemName: "icloud.and.arrow.down").frame(height: 32)
            }
            Spacer()
            Button(action: { }) {
                Image(systemName: "list.bullet").frame(height: 32)
            }
            Spacer()
            Button(action: { }) {
                Image(systemName: "desktopcomputer").frame(height: 32)
            }
            Spacer()
            Button(action: { }) {
                Image(systemName: "shuffle").frame(height: 32)
            }
            
        }.padding(.horizontal)
    }
}


#Preview {
    PlaybackActionsComponent()
}


