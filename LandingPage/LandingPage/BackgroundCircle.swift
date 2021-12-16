//
//  BackgroundCircle.swift
//  LandingPage
//
//  Created by HariRamya on 16/12/2021.
//

import SwiftUI

struct BackgroundCircle: View {
    @State var color: Color = Color("AccentColor")
    @State var opacity: Double = 0.2
    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(opacity), lineWidth: 50)
            ZStack {
                Circle()
                    .stroke(color.opacity(opacity), lineWidth:125)
                Circle()
                    .stroke(color.opacity(opacity), lineWidth:100)
            }
        }
        .padding(80)
    }
}

struct BackgroundCircle_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundCircle()
    }
}
