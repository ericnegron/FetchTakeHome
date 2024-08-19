//
//  MealList.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/14/24.
//

import Foundation

struct MealList: Decodable {
    let meals: [Meal]
}

struct Dessert: Decodable {
    let strMeal: String?
    let strMealThumb: String?
    let idMeal: String?
}
