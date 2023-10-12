//
//  HeaderComponent.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/11/23.
//

import SwiftUI

struct HeaderComponent: View {
    @Binding var showMenu: Bool
    @State private var showingAlert = false

    var body: some View {
            HStack {
                Button(action: {
                    withAnimation {
                        showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                }
                Spacer()
                RoxetteComponent().foregroundStyle(Color.black)
                Spacer()
                Button(action: {
                    showingAlert = true
                }) {
                    Image(systemName: "signature")
                }
                .alert("meow!", isPresented: $showingAlert) {
                    Button("meow", role: .cancel) { }
                }
            }.padding()
            
    }
}
