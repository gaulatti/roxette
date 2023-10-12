//
//  NowPlayingComponent.swift
//  roxette
//
//  Created by jgodoynunez on 10/12/23.
//

import Foundation
import SwiftUI

struct NowPlayingComponent: View {
    var body: some View {
        Text("Now Playing")
            .font(Font.custom("Midnight Rider", size: 48).weight(.light))
            .frame(width: UIScreen.main.bounds.width * 0.6, height: 60)
    }
}


#Preview {
    NowPlayingComponent()
}
