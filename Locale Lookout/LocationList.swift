//
//  LocationList.swift
//  Locale Lookout
//
//  Created by Akshit Nassa on 4/12/24.
//

import SwiftUI

struct LocationList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    
    var filteredLocations: [Location] {
        modelData.locations.filter { location in
                (!showFavoritesOnly || location.isFavorite)
            }
        }
    var body: some View {
        NavigationSplitView {
            List{
                Toggle(isOn: $showFavoritesOnly) {
                                    Text("Favorites only")
                                }
                ForEach(filteredLocations){ location in
                    NavigationLink{
                        Detail(location: location)
                    } label: {
                        LocationRow(location: location)
                    }
                }
            }
            .animation(.default, value: filteredLocations)
            .navigationTitle("Locale Lookout")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LocationList()
        .environmentObject(ModelData())
        
}
