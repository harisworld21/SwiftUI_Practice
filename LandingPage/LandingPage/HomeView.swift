//
//  HomeView.swift
//  LandingPage
//
//  Created by HariRamya on 13/12/2021.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("landingPage") var isOnBoardingViewActive = false
    var body: some View {
        VStack {
        //HEADER
        Spacer()
            ZStack {
                BackgroundCircle(color: .gray, opacity: 0.2)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
            }
            .padding()
        //MIDDLE
            Text("The time that leads to mastery is dependent on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
        //BOTTOM
        Spacer()
        Button(action: {
            isOnBoardingViewActive = true
        }) {
            Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                .imageScale(.large)
            Text("Restart")
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        }
        .padding(10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
