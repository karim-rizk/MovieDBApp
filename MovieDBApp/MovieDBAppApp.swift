//
//  MovieDBAppApp.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 16.07.25.
//

import SwiftUI

@main
struct MovieDBAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
