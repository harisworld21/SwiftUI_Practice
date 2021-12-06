//
//  ContentView.swift
//  AsyncImage
//
//  Created by HariRamya on 06/12/2021.
//

import SwiftUI

extension Image {
    func aspectFit() -> some View {
        self
            .resizable()
            .scaledToFit()
            .padding(50)
    }
    
    func iconModifier() -> some View {
        self
            .aspectFit()
            .frame(maxWidth: 200)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    private let imageUrl = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
//    MARK: -1. BASIC
//        AsyncImage(url: URL(string: imageUrl))
//            .padding()
//    MARK: -2. SCALE
//        AsyncImage(url: URL(string: imageUrl),scale: 2.0)
//    MARK: -3. PLACEHOLDER
//        AsyncImage(url: URL(string: imageUrl), content: { img in
//            img.aspectFit()
//        }, placeholder: {
//            Image(systemName: "photo.circle.fill")
//                .iconModifier()
//        })
//    MARK: -4. PHASE
        AsyncImage(url: URL(string: imageUrl)) { phase in
            if let image = phase.image {
                image.aspectFit()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
