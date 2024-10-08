//
//  TestData.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/14/24.
//

import Foundation

let mealDetailTestFeature: Data = """
{
    "meals": [
        {
            "idMeal": "52893",
            "strMeal": "Apple & Blackberry Crumble",
            "strDrinkAlternate": null,
            "strCategory": "Dessert",
            "strArea": "British",
            "strInstructions": "Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\\r\\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\\r\\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
            "strTags": "Pudding",
            "strYoutube": "https://www.youtube.com/watch?v=4vhcOwVBDO4",
            "strIngredient1": "Plain Flour",
            "strIngredient2": "Caster Sugar",
            "strIngredient3": "Butter",
            "strIngredient4": "Braeburn Apples",
            "strIngredient5": "Butter",
            "strIngredient6": "Demerara Sugar",
            "strIngredient7": "Blackberrys",
            "strIngredient8": "Cinnamon",
            "strIngredient9": "Ice Cream",
            "strIngredient10": "",
            "strIngredient11": "",
            "strIngredient12": "",
            "strIngredient13": "",
            "strIngredient14": "",
            "strIngredient15": "",
            "strIngredient16": "",
            "strIngredient17": "",
            "strIngredient18": "",
            "strIngredient19": "",
            "strIngredient20": "",
            "strMeasure1": "120g",
            "strMeasure2": "60g",
            "strMeasure3": "60g",
            "strMeasure4": "300g",
            "strMeasure5": "30g",
            "strMeasure6": "30g",
            "strMeasure7": "120g",
            "strMeasure8": "¼ teaspoon",
            "strMeasure9": "to serve",
            "strMeasure10": "",
            "strMeasure11": "",
            "strMeasure12": "",
            "strMeasure13": "",
            "strMeasure14": "",
            "strMeasure15": "",
            "strMeasure16": "",
            "strMeasure17": "",
            "strMeasure18": "",
            "strMeasure19": "",
            "strMeasure20": "",
            "strSource": "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
            "strImageSource": null,
            "strCreativeCommonsConfirmed": null,
            "dateModified": null
        }
    ]
}
""".data(using: .utf8)!


let dessertListTestFeature: Data = """
{
    "meals": [
        {
            "strMeal": "Baked salmon with fennel & tomatoes",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/1548772327.jpg",
            "idMeal": "52959"
        },
        {
            "strMeal": "Cajun spiced fish tacos",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/uvuyxu1503067369.jpg",
            "idMeal": "52819"
        },
        {
            "strMeal": "Escovitch Fish",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/1520084413.jpg",
            "idMeal": "52944"
        }
    ]
}
""".data(using: .utf8)!
