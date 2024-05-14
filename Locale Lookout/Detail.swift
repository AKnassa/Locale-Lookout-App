//
//  Detail.swift
//  Locale Lookout
//
//  Created by Akshit Nassa on 4/12/24.
//

import SwiftUI

struct Detail: View {
    @EnvironmentObject var modelData: ModelData
        var location: Location

        var locationIndex: Int {
            modelData.locations.firstIndex(where: { $0.id == location.id })!
        }
    var body: some View {
        ScrollView {
            MapView(coordinate: location.locationCoordinate)
                .frame(height: 300)
            CircleImage(image: location.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading){
                HStack{Text(location.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.locations[locationIndex].isFavorite)
                }
                HStack {
                    Text(location.park)
                        .font(.subheadline)
                    Spacer()
                    Text(location.state)
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                Text("About \(location.name)")
                .font(.title2)
                Text(location.description)
                
            }
            .padding()
        }
        .navigationTitle(location.name)
        .navigationBarTitleDisplayMode(.inline)

    }
}

#Preview {
    let modelData = ModelData()
       return Detail(location: modelData.locations[0])
           .environmentObject(modelData)
}
