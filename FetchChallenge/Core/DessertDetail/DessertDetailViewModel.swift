//
//  DessertDetailViewModel.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/15/24.
//

import Foundation


@MainActor
class DessertDetailViewModel: ObservableObject {
    
    // Public
    @Published var meal: Meal
    @Published var didError: Bool = false
    
    var instructions: [String]? {
        guard let strInstructions = meal.strInstructions else { return nil }
        
        return strInstructions
            .components(separatedBy: .newlines)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .map { cleanInstructions($0) }
    }
    
    // Private
    @Published private(set) var state: State = .na
    
    // Error Handling
    enum State {
        case na
        case loading
        case success(data: Meal)
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
    
    
    // MARK: - Init
    init(meal: Meal) {
        self.meal = meal
    }
    
    
    // MARK: - View Setup
    private func cleanInstructions(_ instruction: String) -> String {
        return instruction
            .replacingOccurrences(of: "\u{00A0}", with: " ")
            .replacingOccurrences(of: "\u{200B}", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    
    // MARK: - Networking
    func fetchDessertDetails(_ dessertId: String) {
        state = .loading
        
        Task {
            do {
                meal = try await NetworkManager.shared.getDessertDetailsFor(dessertId: dessertId)
                state = .success(data: meal)
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
