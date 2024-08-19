//
//  DessertDetailLoadingView.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/16/24.
//

import SwiftUI

struct DessertDetailLoadingView: View {
    
    
    var body: some View {
        ContentLoadingView()
            .frame(width: 350, height: 150)
            .mask {
                Path(roundedRect: CGRect(x: 0, y: 0, width: 350, height: 150), cornerRadii: RectangleCornerRadii(topLeading: 8, bottomLeading: 8, bottomTrailing: 8, topTrailing: 8))
            }
            .background(
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.white)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .shadow(radius: 8, x: 0, y: 8)
                    
                }
            )    
    }
}

#Preview {
    DessertDetailLoadingView()
}
