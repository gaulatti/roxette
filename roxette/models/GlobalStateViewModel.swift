//
//  GlobalStateViewModel.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/12/23.
//

import Foundation

class GlobalStateViewModel: ObservableObject {
    static let shared = GlobalStateViewModel()

    @Published var currentSidebar: SidebarsEnum = .none
}
