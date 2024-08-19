//
//  Error+Extensions.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/17/24.
//

import Foundation


extension Error {
    /**
     Converts an error into a `DessertError` based on the type of error.
     
     Maps a specific `URLError.Code` value to corresponding `DessertError` case.  For all other
     `URLError` codes, a custom error is returned using the localized description of the `URLError`.
     An `unkonwnError` is returned for cases where the `URLError` fails to cast to `DessertError`.
     
     - Returns: A `DessertError` representing the error.
     */
    func toDessertError() -> DessertError {
        if let urlError = self as? URLError {
            switch urlError.code {
            case .notConnectedToInternet, .networkConnectionLost, .timedOut:
                return DessertError.noNetworkConnection
            default:
                return DessertError.customError(message: urlError.localizedDescription)
            }
        } else {
            return DessertError.unknownError
        }
    }
}
