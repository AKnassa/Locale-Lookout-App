//
//  CategoryItem.swift
//  Locale Lookout
//
//  Created by Akshit Nassa on 4/19/24.
//

import SwiftUI

struct CategoryItem: View {
    var location: Location
    var body: some View {
        VStack(alignment: .leading) {
            location.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(8)
                .padding(.bottom, 4)
            HStack {
                Text(location.name)
                    .foregroundStyle(.primary)
                    .font(.caption)
            }
        }
        .padding(.leading, 15)
    }
}

#Preview {
    CategoryItem(location: ModelData().locations[0])
}
