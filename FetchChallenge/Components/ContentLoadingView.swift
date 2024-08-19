//
//  ContentLoadingView.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/14/24.
//

import SwiftUI

struct ContentLoadingView: View {
    
    @State private var startingPoint: UnitPoint = .init(x: -1.8, y: -1.2)
    @State private var endPoint: UnitPoint = .init(x: 0, y: -0.2)
    
    private var gradientColors = [
        Color(uiColor: .systemGray5),
        Color(uiColor: .systemGray6),
        Color(uiColor: .systemGray5)
    ]
    
    var body: some View {
        LinearGradient(colors: gradientColors, startPoint: startingPoint, endPoint: endPoint)
            .onAppear {
                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: false)) {
                    startingPoint = .init(x: 1, y: 1)
                    endPoint = .init(x: 2.2, y: 2.2)
                }
            }
    }
}

#Preview {
    ContentLoadingView()
}
