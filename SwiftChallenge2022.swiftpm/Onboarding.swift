//
//  Onboarding.swift
//  SwiftChallenge2022
//
//  Created by Madhav Gulati on 4/21/22.
//

import SwiftUI

struct Onboarding: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack {
                        Text("BING BONG BING BONG")
                    }
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
                NavigationLink(destination: WalkthroughView()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(red: 255/255, green: 177/255, blue: 26/255))
                            .frame(width: 400, height: 75)
                        Text("GET STARTED")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }
                .padding(.vertical)
                .padding(.vertical)
                .padding(.vertical)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
            .navigationTitle(Text(""))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}
