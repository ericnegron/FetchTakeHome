//
//  FetchChallengeTests.swift
//  FetchChallengeTests
//
//  Created by Eric Negron on 8/13/24.
//

import XCTest
@testable import FetchChallenge

final class FetchChallengeTests: XCTestCase {

    
    // MARK: - Test Dessert List
    func testDessertListJSONDecoderDecodesList() throws {
        // Given
        let decoder = JSONDecoder()
        
        // When
        let desserts = try decoder.decode(MealList.self, from: dessertListTestFeature)
        
        // Then
        XCTAssertEqual(desserts.meals[0].idMeal, "52959")
        XCTAssertEqual(desserts.meals[0].strMeal, "Baked salmon with fennel & tomatoes")
    }
    
    
    // MARK: - Test Dessert Details
    func testDessertDetailJSONDecoderDecodesDetails() throws {
        //  Given
        let decoder = JSONDecoder()
        
        // When
        let dessertDetails = try decoder.decode(MealResponse.self, from: mealDetailTestFeature)
        
        // Then
        XCTAssertEqual(dessertDetails.meals[0].idMeal, "52893")
        XCTAssertEqual(dessertDetails.meals[0].strMeal, "Apple & Blackberry Crumble")
    }
    
    func testDynamicCodingKeysDecodeDessertIngredients() throws {
        // Given
        let decoder = JSONDecoder()
        
        // When
        let dessertDetails = try decoder.decode(MealResponse.self, from: mealDetailTestFeature)
        let meal = dessertDetails.meals[0]
        
        // Then
        let expectedIngredients: [String: String] =  [
            "Plain Flour": "120g",
            "Caster Sugar": "60g",
            "Butter": "60g",
            "Braeburn Apples": "300g",
            "Demerara Sugar": "30g",
            "Blackberrys": "120g",
            "Cinnamon": "¼ teaspoon",
            "Ice Cream": "to serve"
        ]
        
        let ingredients = meal.ingredients ?? [:]
        
        XCTAssertEqual(ingredients.count, expectedIngredients.count, "Ingredient counts don't match")
        
        for (key, value) in expectedIngredients {
            XCTAssertEqual(ingredients[key], value, "Ingredient key doesn't match \(key)")
        }
        
    }
    
    
}
