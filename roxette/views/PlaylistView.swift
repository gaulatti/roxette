//
//  PlaylistView.swift
//  roxette
//
//  Created by jgodoynunez on 10/12/23.
//

import SwiftUI

struct PlaylistView: View {
    @EnvironmentObject var globalState: GlobalStateViewModel

    var body: some View {
        HStack(alignment: .top) {
            Button(action: {
                withAnimation {
                    globalState.currentSidebar = .none
                }
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
                .frame(height: 60)
                .padding()
            }
            Spacer()
            VStack(alignment: .trailing) {
                RoxetteComponent()
                    .padding(.top)
                    .foregroundColor(Color.menuPurple)
                    .offset(x: UIScreen.main.bounds.width * 0.15)
                Spacer()
                Rectangle()
                    .foregroundColor(.menuPurple)
                    .frame(width: 120, height: 120)
                    .cornerRadius(15)
                    .padding(.bottom)
                    .offset(x: UIScreen.main.bounds.width * 0.15)
                Spacer()
            }.frame(width: UIScreen.main.bounds.width * 0.7)
        }
        .background(Color.menuBackground)
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView()
            .environmentObject(GlobalStateViewModel.shared)
    }
}
