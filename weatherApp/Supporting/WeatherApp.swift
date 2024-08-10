//
//  weatherAppApp.swift
//  weatherApp
//
//  Created by Daniil Kim on 10.08.2024.
//

import SwiftUI

@main
struct WeatherApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
