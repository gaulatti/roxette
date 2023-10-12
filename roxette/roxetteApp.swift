//
//  roxetteApp.swift
//  roxette
//
//  Created by Javier Godoy Núñez on 10/10/23.
//

import SwiftUI
import SwiftData

@main
struct roxetteApp: App {
    
    init() {
        printFonts()
    }
    
    func printFonts() {
        let familyNames = UIFont.familyNames
        for familyName in familyNames {
            print(familyName)
        }
    }
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
