//
//  ModelData.swift
//  Locale Lookout
//
//  Created by Akshit Nassa on 4/12/24.
//

import Foundation

class ModelData: ObservableObject{
    @Published var locations: [Location] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    var profile = Profile.default
    
    var features: [Location] {
           locations.filter { $0.isFeatured }
       }
    
    var categories: [String: [Location]] {
            Dictionary(
                grouping: locations,
                by: { $0.category.rawValue }
            )
        }
    
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
