//
//  DessertDetailView.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/15/24.
//

import SwiftUI
import AVKit

struct DessertDetailView: View {
    
    // View Model
    @StateObject var viewModel: DessertDetailViewModel
    
    // Private
    @State private var selectedSegment = 0
    @State private var shouldFetchData = true
    
    var body: some View {
        ScrollView(.vertical) {
            
            switch viewModel.state {
            case .loading:
                DessertDetailLoadingView()
                    .offset(y: 150)
            case .success(let meal):
                VStack(spacing: 0) {
                    
                    ZStack(alignment: .bottom) {
                        
                        // Image
                        ImageLoaderView(
                            url: URL(string: meal.strMealThumb ?? ""),
                            placeholder: Image(systemName: "frying.pan"),
                            width: 450,
                            height: 450,
                            cornerRadius: 0
                        ).mask {
                            Path(roundedRect: CGRect(x: 0, y: 0, width: 450, height: 450),
                                 cornerRadii: RectangleCornerRadii(bottomLeading: 90, bottomTrailing: 90))
                        }
                        
                        // Info Rectangle
                        DessertDetailInfoView(meal: meal)
                            .offset(y: 65)
                    }
                    
                    
                    // Picker
                    Picker("", selection: $selectedSegment) {
                        Text("Ingredients").tag(0)
                        Text("Instructions").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 350)
                    .padding(.top, 85)
                    .padding(.bottom, 20)
                    
                    if selectedSegment == 0 {
                        DessertDetailIngredientsView(meal: meal)
                            .transition(.push(from: .trailing))
                    } else {
                        DessertDetailInstructionsView(viewModel: viewModel)
                            .transition(.push(from: .leading))
                            .padding(.horizontal)
                    }
                                    
                }
            default:
                EmptyView()
            }
            
        }        
        .ignoresSafeArea(edges: .top)
        .animation(.easeInOut(duration: 0.5), value: selectedSegment)
        
        // MARK: - Networking
        .task {
            if shouldFetchData {
                
                viewModel.fetchDessertDetails(viewModel.meal.idMeal!)
                shouldFetchData = false
                
            }
        }
        
        // MARK: - Alerting
        .alert("Something went wrong!", isPresented: $viewModel.didError, presenting: viewModel.state) { _ in
            Button("Cancel", role: .destructive) {}
            
            Button("Retry", role: .cancel) {
                viewModel.fetchDessertDetails(viewModel.meal.idMeal ?? "")
            }
        } message: { detail in
            Image(systemName: viewModel.alertImageName)
                .foregroundStyle(.red)
                .font(.system(size: 40))
            Text(viewModel.errorMessage ?? "Unknown Error")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
        }
        
    }
}

#Preview {
    DessertDetailView(viewModel: DessertDetailViewModel(meal: MockData().meal.meals[0]))
}
