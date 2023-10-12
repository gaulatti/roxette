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
        HStack {
            Text("**Now Playing:** 3 children among family of 6 killed on kibbutz near Gaza")
                .font(Font.custom("RNS Sanz", size: 16))
                .foregroundColor(.menuPurple)
                .frame(width: UIScreen.main.bounds.width * 0.6)
        }.padding()
    }
}
