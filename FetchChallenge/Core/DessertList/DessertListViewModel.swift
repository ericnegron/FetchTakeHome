//
//  DessertListViewModel.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/14/24.
//

import Foundation


@MainActor class DessertListViewModel: ObservableObject {
    
    // Public
    @Published var desserts: [Meal]
    @Published var didError: Bool = false
    
    // Private
    @Published private(set) var state: State = .idle
    
    
    // Error Handling
    enum State {
        case idle
        case loading
        case success(data: [Meal])
        case failed(error: Error)
    }
    
    var errorMessage: String? {
        if case let .failed(error) = state {
            return ErrorUtility.errorMessage(for: error)
        }
        return nil
    }
    
    var alertImageName: String {
        if case let .failed(error) = state {
            return ErrorUtility.alertImageName(for: error)
        }
        return "exclamationmark.triangle"
    }
    
    // Init
    init(desserts: [Meal] = []) {
        self.desserts = desserts
    }
    
    
    // MARK: - Networking
    func fetchDessertList() {
        state = .loading
        
        Task {
            do {
                desserts = try await NetworkManager.shared.getDessertList()
                state = .success(data: desserts)
            } catch let error as DessertError {
                state = .failed(error: error)
                didError = true
            } catch {
                state = .failed(error: DessertError.unknownError)
                didError = true
            }
        }
    }
    
}


