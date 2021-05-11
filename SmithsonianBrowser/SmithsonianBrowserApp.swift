//
//  SmithsonianBrowserApp.swift
//  SmithsonianBrowser
//
//  Created by Jeff Handy on 5/11/21.
//

import SwiftUI

@main
struct SmithsonianBrowserApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
