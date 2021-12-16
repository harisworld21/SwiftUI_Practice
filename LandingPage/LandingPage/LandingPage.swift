//
//  LandingPage.swift
//  LandingPage
//
//  Created by HariRamya on 13/12/2021.
//

import SwiftUI

struct LandingPage: View {
    @AppStorage("landingPage") var isOnBoardingViewActive = true
    @State private var downloadAmount = 0.0
    @State private var buttonWidth = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var capsuleWidth: CGFloat = 70
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            Color("AccentColor")
                .ignoresSafeArea()
            VStack(spacing: 3){
            //TOP
            VStack(spacing: 5) {
                Text("Share.")
                    .font(.system(size: 35))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                ProgressView("Downloading...",value: downloadAmount, total: 100)
                    .onReceive(timer, perform: { timer in
                        if downloadAmount < 100 {
                            downloadAmount += 1
                        }
                    })
                    .shadow(color: .white, radius: 0.5)
                    .progressViewStyle(.linear)
                    .accentColor(.black)
                    .frame(minHeight: 80)
                Text("It's not how much we give but how much love we put into giving")
                    .font(.footnote)
                    .padding(-10)
                .foregroundColor(.white)
            }
            .padding(20)
            //CENTER
                ZStack {
                    BackgroundCircle(color: .black, opacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
            //BOTTOM
                ZStack {
                    //1. Background
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(10)
                    //2. Call 2 action
                    Text("Get Started")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    //3. CAPSULE INSIDE
                    HStack {
                        Capsule()
                            .fill(Color("RedColor"))
                            .frame(width: buttonOffset + 70)
                        Spacer()
                    }
                    //4. Circle Draggable
                    HStack {
                        ZStack {
                                Circle()
                                    .fill(Color("RedColor"))
                                Circle()
                                    .fill(.black.opacity(0.15))
                                    .padding(8)
                                Image(systemName: "chevron.right.2")
                                    .font(.system(size: 14, weight: .bold))
                                
                        }
                        .foregroundColor(.white)
                        .frame(width: 70, height: 70, alignment: .center)
                        .offset(x:buttonOffset)
                        .gesture(DragGesture()
                                    .onChanged{ gesture in
                            if gesture.translation.width > 0 && buttonOffset < buttonWidth - 80 {
                                capsuleWidth += gesture.translation.width - buttonOffset
                                buttonOffset = gesture.translation.width
                            }
                        }
                                    .onEnded({ _ in
                            if buttonOffset > buttonWidth / 2 {
                                capsuleWidth = buttonOffset + 70
                                buttonOffset = buttonWidth - 80
                                isOnBoardingViewActive = false
                            }
                            else {
                                buttonOffset = 0
                                capsuleWidth = 70
                            }
                        })
                        )
                        .onTapGesture {
                            isOnBoardingViewActive = false
                        }
                        
                        Spacer()
                    }
                }
                .foregroundColor(.white)
                .frame(width:buttonWidth, height: 70, alignment: .center)
                
            }
            .padding(20)
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
