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
    var currentItem: AsyncImageList
    private let imageUrl = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
        switch currentItem {
        case .BASIC:
            //            MARK: -1. BASIC
            AsyncImage(url: URL(string: imageUrl))
                .padding()
        case .SCALE:
            //            MARK: -2. SCALE
            AsyncImage(url: URL(string: imageUrl),scale: 2.0)
        case .PLACEHOLDER:
            //            MARK: -3. PLACEHOLDER
            AsyncImage(url: URL(string: imageUrl), content: { img in
                img.aspectFit()
            }, placeholder: {
                Image(systemName: "photo.circle.fill")
                    .iconModifier()
            })
        case .PHASE:
            //            MARK: -4. PHASE
            AsyncImage(url: URL(string: imageUrl)) { phase in
                if let image = phase.image {
                    image.aspectFit()
                }
                else if phase.error != nil {
                    Image("img")
                        .aspectFit()
                }
                else  {
                    Image(systemName: "ant.circle.fill").iconModifier()
                }
            }
        case .ANIMATION:
            //            MARK: -5. ANIMATION
            AsyncImage(url: URL(string: imageUrl), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
                switch phase {
                case .success(let image):
                    image.aspectFit()
                        .transition(.move(edge: .bottom))
                        .transition(.slide)
                        .transition(.scale)
                case .failure(_) :
                    Image("img").aspectFit()
                case .empty:
                    Image(systemName: "ant.circle.fill").iconModifier()
                @unknown default:
                    ProgressView()
                }
            }
            .padding(40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentItem: AsyncImageList.BASIC)
    }
}


