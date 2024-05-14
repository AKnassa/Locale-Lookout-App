//
//  Locale_LookoutApp.swift
//  Locale Lookout
//
//  Created by Akshit Nassa on 4/12/24.
//

import SwiftUI

@main
struct Locale_LookoutApp: App {
    @State private var modelData = ModelData()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
