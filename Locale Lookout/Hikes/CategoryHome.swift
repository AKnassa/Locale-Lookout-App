//
//  CategoryHome.swift
//  Locale Lookout
//
//  Created by Akshit Nassa on 4/19/24.
//

import SwiftUI


struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false

    var body: some View {
        NavigationSplitView {
            List {
                PageView(pages: modelData.features.map {FeatureCard(location: $0) })
            .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryNmae: key, items: modelData.categories[key]!)
                               }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                            Button {
                                showingProfile.toggle()
                            } label: {
                                Label("User Profile", systemImage: "person.crop.circle")
                            }
                        }
                        .sheet(isPresented: $showingProfile) {
                            ProfileHost()
                                .environmentObject(modelData)
                        }
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    CategoryHome()
        .environmentObject(ModelData())
}
