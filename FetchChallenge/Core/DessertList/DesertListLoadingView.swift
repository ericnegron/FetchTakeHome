//
//  DesertListLoadingView.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/16/24.
//

import SwiftUI

struct DesertListLoadingView: View {
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            VStack(alignment: .leading) {
                ContentLoadingView()
                    .frame(width: 350, height: 175)
                    .mask {
                        Path(roundedRect: CGRect(x: 0, y: 0, width: 350, height: 175),
                             cornerRadii: RectangleCornerRadii(topLeading: 8, topTrailing: 8))
                    }
                
                Text("Title")
                    .foregroundStyle(.black)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding([.leading, .bottom])
                    .padding(.top, 5)
                    .overlay {
                        ContentLoadingView()
                            .padding([.bottom, .leading])
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
}

#Preview {
    DesertListLoadingView()
}
