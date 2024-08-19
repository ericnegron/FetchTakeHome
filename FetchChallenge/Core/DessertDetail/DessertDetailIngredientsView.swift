//
//  DessertDetailIngredientsView.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/15/24.
//

import SwiftUI

struct DessertDetailIngredientsView: View {
    // Environment
    @Environment(\.colorScheme) var colorScheme
    
    @State var meal: Meal
    
    var body: some View {
        
        if let ingredients = meal.ingredients {
            
            LazyVStack(spacing: 12) {
                ForEach(Array(ingredients), id: \.key) { key, value in
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 375, height: 60)
                        .foregroundStyle(.white)
                        .background(
                            GeometryReader { geometry in
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(.white)
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    .shadow(radius: 2, x: 0, y: 2)
                                
                            }
                        )
                        .overlay {
                            HStack {
                                Text(key)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Spacer()
                                Text(value)
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                            }
                            .padding()
                            .foregroundStyle(.black)
                        }
                        
                    
                }
            }
            
            
        }
        
        
    }
}

#Preview {
    DessertDetailIngredientsView(meal: MockData().meal.meals[0])
}
