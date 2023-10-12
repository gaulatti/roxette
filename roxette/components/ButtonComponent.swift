//
//  ButtonComponent.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/11/23.
//

import SwiftUI

struct ButtonComponent: View {
    let label: String
    let action: () -> Void

    var body: some View {
        Button(label) {
            withAnimation {
                self.action()
            }
        }
        .font(.menuItem)
        .foregroundColor(.menuPurple)
        .frame(
            width: UIScreen.main.bounds.width * 0.6,
            alignment: .topLeading
        )
        .padding(.bottom)
    }
}
