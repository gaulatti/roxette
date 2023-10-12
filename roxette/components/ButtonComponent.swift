//
//  ButtonComponent.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/11/23.
//

import SwiftUI

struct ButtonComponent: View {
    let label: String
    let view: ViewsEnum
    let currentView: ViewsEnum
    let action: () -> Void

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
            if(view == currentView) {
                Circle()
                    .frame(width: 32, height: 32)
                    .offset(x: -45)
                    .foregroundColor(.menuPurple)
                    .shadow(color: .black, radius: 10)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            }

            Button(label) {
                withAnimation {
                    self.action()
                }
            }
            .font(.menuItem)
            .foregroundColor(.menuPurple)
            .frame(
                width: UIScreen.main.bounds.width * 0.6,
                alignment: .leading
            )

        })
        .padding(.bottom)
        
    }
}
