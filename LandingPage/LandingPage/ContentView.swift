//
//  ContentView.swift
//  LandingPage
//
//  Created by HariRamya on 13/12/2021.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("landingPage") var isOnBoardingViewActive = true
    var body: some View {
        ZStack {
            if isOnBoardingViewActive {
                LandingPage()
            }
            else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
