//
//  CategoryRow.swift
//  Locale Lookout
//
//  Created by Akshit Nassa on 4/19/24.
//

import SwiftUI

struct CategoryRow: View {
    var categoryNmae: String
    var items: [Location]
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryNmae)
                .font(.headline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.leading, 15)
                .padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { location in
                        NavigationLink {
                            Detail(location: location)
                            
                        } label: {
                            CategoryItem(location: location)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let locations = ModelData().locations
       return CategoryRow(
        categoryNmae: locations[0].category.rawValue,
           items: Array(locations.prefix(3))
       )
}
