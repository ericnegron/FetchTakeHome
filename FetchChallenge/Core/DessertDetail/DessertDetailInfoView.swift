//
//  DessertDetailInfoView.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/17/24.
//

import SwiftUI

struct DessertDetailInfoView: View {
    
    @State var meal: Meal
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .frame(width: 350, height: 150)
            .foregroundColor(.white)
            .background(
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.white)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .shadow(radius: 8, x: 0, y: 8)
                    
                }
            )
            .overlay {
                VStack {
                    // Meal Name
                    if let name = meal.strMeal {
                        Text(name)
                            .font(.title3)
                            .fontWeight(.bold)
                            .lineLimit(3)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.black)
                    }
                    // Number of Ingredients
                    if let numIngredients = meal.ingredients?.count {
                        Text("\(numIngredients) Ingredients")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                    }
                    
                    // Additional Info
                    HStack(alignment: .center) {
                        Image(systemName: "globe.desk")
                            .foregroundStyle(.orange)
                        if let geography = meal.strArea {
                            Text(geography)
                                .font(.caption)
                                .fontWeight(.light)
                                .foregroundStyle(.gray)
                                .padding(.trailing, 20)
                        }
                        
                        Image(systemName: "fork.knife")
                            .foregroundStyle(.orange)
                        if let mealType = meal.strCategory {
                            Text(mealType)
                                .font(.caption)
                                .fontWeight(.light)
                                .foregroundStyle(.gray)
                        }
                        
                    }
                    .padding(.top)
                }
            }
        
        
    }
}

#Preview {
    DessertDetailInfoView(meal: MockData().meal.meals[0])
}
