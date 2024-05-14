//
//  LocationRow.swift
//  Locale Lookout
//
//  Created by Akshit Nassa on 4/12/24.
//

import SwiftUI

struct LocationRow: View {
    var location: Location
    
    var body: some View {
        HStack {
            location.image
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            Text(location.name)
            Spacer()
            if location.isFavorite{
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    let locations = ModelData().locations
        return Group {
        LocationRow(location: locations[0])
        LocationRow(location: locations[1])
    }
}

