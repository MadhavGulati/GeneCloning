//
//  Onboarding.swift
//  SwiftChallenge2022
//
//  Created by Madhav Gulati on 4/21/22.
//

import SwiftUI

struct Onboarding: View {
    @Binding var onboardingBool:Bool
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ZStack {
                    AnimatedBackground().edgesIgnoringSafeArea(.all).blur(radius:50)
                        .frame(width: geo.size.width, height: geo.size.height)
                    VStack {
                        HStack {
                            Image("fishtank")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geo.size.width * 0.4)
                                .padding()
                            VStack {
                                Spacer()
                                Text("Gene Cloning")
                                    .font(.largeTitle)
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .offset(x:-100)
                                Text("MAKING A GLOWING FISH")
                                    .font(.title)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .offset(x:-100)
                                Spacer()
                            }
                        }
                        NavigationLink(destination: WalkthroughView(onboardingBool: $onboardingBool).navigationBarBackButtonHidden(true)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(red: 255/255, green: 177/255, blue: 26/255))
                                    .frame(width: 400, height: 75)
                                Text("GET STARTED")
                                    .font(.title)
                                    .foregroundColor(Color.white)
                                    .bold()
                                    
                            }
                            .padding()
                            .padding()
                            .padding()
                        }
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationTitle(Text(""))
        }
    }
}



//code from YouTube tutorial by user "Digital Hole"
//https://www.youtube.com/watch?v=YhhGx0pLOnk
//Used in order to create the animated gradient background visible in the first scene of the app.
struct AnimatedBackground: View {
    @State var start = UnitPoint(x: 0, y:0)
    @State var end = UnitPoint(x: 0, y:2)
    
    let colors = [Color.blue, Color.purple, Color.yellow, Color.green, Color.orange, Color.red]
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors:colors), startPoint: start, endPoint: end)
            .onAppear {
                withAnimation (Animation.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                    self.start = UnitPoint(x: 1, y: -1)
                    self.end = UnitPoint(x: -1, y: 1)
                    self.start = UnitPoint(x: -1, y: 1)
                    self.end = UnitPoint(x:-1, y:-1)
                    self.start = UnitPoint(x:-1, y:-1)
                    self.end = UnitPoint(x:1, y:-1)
                }
            }
    }
}

