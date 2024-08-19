//
//  DessertDetailInstructionsView.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/15/24.
//

import SwiftUI

struct DessertDetailInstructionsView: View {
    // Environment
    @Environment(\.colorScheme) var colorScheme
    
    //View Model
    @State var viewModel: DessertDetailViewModel
    
    
    var body: some View {
        
        if let instructions = viewModel.instructions {
            
            GroupBox {
                
                    ForEach(Array(instructions.enumerated()), id: \.offset) { index, instruction in
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Step \(index + 1)")
                                .font(.headline)
                                .foregroundStyle(.orange)
                                .padding(.leading, 0)
                            
                            Text(instruction)
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                                .padding(.leading)                                
                                
                        }
                        .padding(.vertical, 2)
                        
                    }
                
            }
            .backgroundStyle(colorScheme == .dark ? .gray : Color.BackgroundTheme)
//            .foregroundColor(colorScheme == .dark ? .white : .black)
            .frame(width: 350)
            
            
        }
        
    }
}

#Preview {
    DessertDetailInstructionsView(viewModel: DessertDetailViewModel(meal: MockData().meal.meals[0]))
}
