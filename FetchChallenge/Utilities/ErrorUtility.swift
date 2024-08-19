//
//  ErrorUtility.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/17/24.
//

import Foundation


class ErrorUtility {
    /**
     Returns a user-friendly error message string for a given `Error`.
     
     - Parameter error: The `Error` object for which the message should be generated.
     - Returns: A `String` containing the localized descriptoin of the error.
     */
    static func errorMessage(for error: Error) -> String {
        return error.localizedDescription
    }
    
    /**
     Returns the correct system image name to be used for a given `Error` case.
     
     This function is intended to allow for easier custom alert construction based
     on the type of `Error` generated.
     
     - Parameter error: The `Error` for which the image name should be determined.
     - Returns: A `String` representing the system image name to be used for the appropriate image.
     */
    static func alertImageName(for error: Error) -> String {
        if let networkError = error as? DessertError {
            switch networkError {
            case .noNetworkConnection:
                return "wifi.exclamationmark"
            default:
                return "exclamationmark.triangle"
            }
        }
        return "exclamationmark.triangle"
    }
}
