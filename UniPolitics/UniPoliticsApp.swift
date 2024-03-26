//
//  UniPoliticsApp.swift
//  UniPolitics
//
//  Created by Sarah Akhtar on 2/11/23.
//

import SwiftUI

@main
struct UniPoliticsApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView() //May want to inject a managed object context
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
