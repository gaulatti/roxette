//
//  RoxetteComponent.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/12/23.
//

import SwiftUI

struct LogoComponent: View {
    var body: some View {
        Text("Roxette")
            .font(Font.custom("Midnight Rider", size: 48).weight(.light))
            .frame(height: 60)
    }
}
