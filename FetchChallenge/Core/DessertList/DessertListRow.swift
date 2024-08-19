//
//  DessertListRow.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/14/24.
//

import SwiftUI

struct DessertListRow: View {
    
    @StateObject var viewModel: DessertListViewModel
    var dessert: Meal
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            
            // Image
            VStack(alignment: .leading) {
                ImageLoaderView(url: URL(string: dessert.strMealThumb ?? ""),
                                placeholder: Image(systemName: "frying.pan"),
                                width: 350,
                                height: 175,
                                cornerRadius: 0)

                .mask {
                    Path(roundedRect: CGRect(x: 0, y: 0, width: 350, height: 175),
                         cornerRadii: RectangleCornerRadii(topLeading: 8, topTrailing: 8))
                }
                
                if let name = dessert.strMeal {
                    Text(name)
                        .foregroundStyle(.black)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .padding([.leading, .bottom])
                        .padding(.top, 5)                        
                }
            }
            
            
        
        }
        
         
        .background(
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.white)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .shadow(radius: 8, x: 0, y: 8)
            }
        )
    }
}

#Preview {
    DessertListRow(viewModel: DessertListViewModel(desserts: MockData().dessertList.meals), dessert: MockData().meal.meals[0])
}
