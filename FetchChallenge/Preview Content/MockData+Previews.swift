//
//  MockData+Previews.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/13/24.
//

import Foundation

@Observable
class MockData {
    // Dessert List
    var dessertList: MealList = load("dessertsList.json")
    
    // Dessert Details
    var meal: MealResponse = load("mealDetail.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n Error: \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    } catch {

        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error.localizedDescription)")
    }
}
