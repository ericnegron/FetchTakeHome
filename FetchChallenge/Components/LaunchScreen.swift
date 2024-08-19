//
//  LaunchScreen.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/17/24.
//

import SwiftUI

struct LaunchScreen: View {
    
    @State var isActive: Bool = false
    @State private var rotationAngle: Double = 0
    @State private var viewSize: CGSize = .zero
    
    var body: some View {
        
            
        ZStack(alignment: .top) {
            
            if isActive {
                DessertListView(viewModel: DessertListViewModel())
            } else {
                Image("launchScreen")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(edges: .vertical)
                    .position(x: (viewSize.width / 2) - 50, y: viewSize.height / 2)
                
                Text("Desserts")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .fontDesign(.serif)
                    .foregroundStyle(.white)
                    .padding(.top, 60)
            }
            
            GeometryReader { proxy in
                Color.clear
                    .onAppear {
                        viewSize = proxy.size
                    }
            }
            
            
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.easeInOut(duration: 0.8)) {
                    self.isActive = true
                }
            }
        }
            
            
    }
        
}

#Preview {
    LaunchScreen()
}
