//
//  DessertListView.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/14/24.
//

import SwiftUI

struct DessertListView: View {
    
    // View Model
    @StateObject var viewModel: DessertListViewModel
    
    
    var body: some View {
        NavigationStack {
            
            // MARK: - Main Content
            ScrollView(.vertical) {
                
                switch viewModel.state {
                case .loading:
                    VStack(spacing: 20) {
                        ForEach(0...3, id: \.self) { _ in
                            DesertListLoadingView()
                        }
                    }
                case .success(let desserts):
                    LazyVStack(spacing: 30) {
                        
                        ForEach(desserts, id: \.idMeal) { dessert in
                            NavigationLink {
                                DessertDetailView(viewModel: DessertDetailViewModel(meal: dessert))
                            } label: {
                                DessertListRow(viewModel: viewModel, dessert: dessert)
                            }
                        }
                        
                    }
                default:
                    EmptyView()
                }
                               
            }           
            
            // MARK: - Nav Title
            .navigationTitle("Desserts")
            
            // MARK: - Networking
            .onAppear {
                viewModel.fetchDessertList()
                
            }
            
            .refreshable {
                viewModel.fetchDessertList()
            }
            
            // MARK: - Error Handling
            .alert("Something went wrong!", isPresented: $viewModel.didError, presenting: viewModel.state) { _ in
                Button("Cancel", role: .destructive) {}
                
                Button("Retry", role: .cancel) {
                    viewModel.fetchDessertList()
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
        .tint(.orange)
        
        
    }
}

#Preview {
    DessertListView(viewModel: DessertListViewModel(desserts: MockData().dessertList.meals))
}
