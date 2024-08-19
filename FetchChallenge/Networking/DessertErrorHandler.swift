//
//  DessertError.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/15/24.
//

import Foundation


// MARK: - Dessert Error
enum DessertError: Error, LocalizedError {
    case badURL
    case invalidResponse
    case decodingError
    case noNetworkConnection
    case unknownError
    case customError(message: String)
    
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "The URL you're attempting to reach appears invalid."
        case .invalidResponse:
            return "The server returned an invalid response."
        case .decodingError:
            return "There was a problem decoding the response from the server."
        case .noNetworkConnection:
            return "Please check your internet connection and try again."
        case .unknownError:
            return "An unknown error occured."
        case .customError(let message):
            return message
        }
    }
}


