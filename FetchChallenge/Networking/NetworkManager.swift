//
//  NetworkManager.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/13/24.
//

import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    struct Constants {
        static let listUrl = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        static let detailUrl = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    }
    
    
    // MARK: - Requests
    // List
    func getDessertList() async throws -> [Meal] {
        guard let url = URL(string: Constants.listUrl) else {
            throw DessertError.badURL
        }
  
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // Check for valid response
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw DessertError.invalidResponse
            }
            
            // Deode JSON
            let decoder = JSONDecoder()
            do {
                let results = try decoder.decode(MealList.self, from: data)
                return results.meals
            } catch {
                throw DessertError.decodingError
            }
            
        } catch {
            throw error.toDessertError()
        }
        
    }
    
    // Detail
    func getDessertDetailsFor(dessertId: String) async throws -> Meal {
        guard let url = URL(string: Constants.detailUrl + dessertId) else {
            throw DessertError.badURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // Check for valid response
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw DessertError.invalidResponse
            }
            
            // Decode JSON
            let decoder = JSONDecoder()
            do {
                let results = try decoder.decode(MealResponse.self, from: data)
                return results.meals[0]
            } catch {
                throw DessertError.decodingError
            }
            
        } catch {
            throw error.toDessertError()
        }
        
    }
}
