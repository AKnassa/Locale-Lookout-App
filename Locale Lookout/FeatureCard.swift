//
//  FeatureCard.swift
//  Locale Lookout
//
//  Created by Akshit Nassa on 4/26/24.
//

import SwiftUI


struct FeatureCard: View {
    var location: Location


    var body: some View {
        location.featureImage?
            .resizable()
            .overlay {
                TextOverlay(location: location)
                        }
    }
}

struct TextOverlay: View {
    var location: Location


    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }


    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.title)
                    .bold()
                Text(location.park)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}


#Preview {
    FeatureCard(location: ModelData().features[0])
        .aspectRatio(3 / 2, contentMode: .fit)
}
