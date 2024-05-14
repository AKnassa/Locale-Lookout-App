//
//  ContentView.swift
//  Locale Lookout
//
//  Created by Akshit Nassa on 4/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    enum Tab {
            case featured
            case list
        }

    var body: some View {
        TabView(selection: $selection){
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            LocationList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            
        }

    }
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
}
