//
//  ImageLoaderView.swift
//  FetchChallenge
//
//  Created by Eric Negron on 8/14/24.
//

import SwiftUI

struct ImageLoaderView: View {
    
    let url: URL?
    let placeholder: Image
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ContentLoadingView()
            case .success(let image):
                image.resizable().aspectRatio(contentMode: .fill)
            case .failure:
                placeholder.resizable().aspectRatio(contentMode: .fit)
            @unknown default:
                placeholder.resizable().aspectRatio(contentMode: .fit)
            }
        }
        .frame(width: width, height: height)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

#Preview {
    ImageLoaderView(url: URL(string: ""),
                    placeholder: Image(systemName: "frying.pan"),
                    width: 250,
                    height: 250,
                    cornerRadius: 8)
}
