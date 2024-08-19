//
//  Meal.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/14/24.
//

import Foundation

struct MealResponse: Decodable {
    let meals: [Meal]
}

struct Meal: Codable {
    let idMeal: String?
    let strMeal: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
    let ingredients: [String: String]?
    let strSource: String?
    
    // IngredientsArray for accessing in ForEach
    var ingredientsArray: [(key: String, value: String)]? {
        return ingredients?.sorted { $0.key < $1.key }
    }
    
    enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strCategory, strArea, strInstructions, strMealThumb, strTags, strYoutube, strSource
    }
    
    struct DynamicCodingKey: CodingKey {
        var stringValue: String
        var intValue: Int?
        
        init?(stringValue: String) {
            self.stringValue = stringValue
            self.intValue = nil
        }
        
        init?(intValue: Int) {
            self.stringValue = "\(intValue)"
            self.intValue = intValue
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        idMeal = try container.decodeIfPresent(String.self, forKey: .idMeal)
        strMeal = try container.decodeIfPresent(String.self, forKey: .strMeal)
        strCategory = try container.decodeIfPresent(String.self, forKey: .strCategory)
        strArea = try container.decodeIfPresent(String.self, forKey: .strArea)
        strInstructions = try container.decodeIfPresent(String.self, forKey: .strInstructions)
        strMealThumb = try container.decodeIfPresent(String.self, forKey: .strMealThumb)
        strTags = try container.decodeIfPresent(String.self, forKey: .strTags)
        strYoutube = try container.decodeIfPresent(String.self, forKey: .strYoutube)
        strSource = try container.decodeIfPresent(String.self, forKey: .strSource)
        
        
        // Ingredients and Quantities
        let dynamicContainer = try decoder.container(keyedBy: DynamicCodingKey.self)
        var ingredientsDict = [String: String]()
        
        for i in 1...20 {
            let ingredientKey = DynamicCodingKey(stringValue: "strIngredient\(i)")!
            let measureKey = DynamicCodingKey(stringValue: "strMeasure\(i)")!
  
            if let ingredient = try dynamicContainer.decodeIfPresent(String.self, forKey: ingredientKey),
                  !ingredient.isEmpty {
                   let measure = try dynamicContainer.decodeIfPresent(String.self, forKey: measureKey) ?? ""
                   
                   // Prevent duplicates
                   if ingredientsDict[ingredient] == nil {
                       ingredientsDict[ingredient] = measure
                   }
               }
        }
        
        ingredients = ingredientsDict
        
    }
    
}
