//
//  Walkthrough.swift
//  SwiftChallenge2022
//
//  Created by Madhav Gulati on 4/21/22.
//

import SwiftUI


struct WalkthroughView: View {
    @State private var angle: Double=0
    @State private var txtI: Int = 0
    @State private var offset: Double = 0
    @State private var opacButton: Double = 1
    @State private var hideButton: Bool = false
    @State private var hideNav: Bool = true
    @State private var opacNav: Double = 1
    var text = [["Have you ever been to a pet store and seen a glowing fish such as this one?", "These fish cannot glow naturally. So how do they become like this?"], ["Some of these fish are changed through genetic modification, in which their physical traits are changed.", "The glowing ability of a fish actually comes from a a special protein called Green Fluorescent Protein, or GFP, in jellyfish."], ["Scientists have been able to transfer this GFP protein to other organisms. This process is called gene cloning.", "Click below to see how this process works!"]]
    var body: some View {
        VStack {
            HStack {
                Text("Hello, World!")
                VStack {
                    Text(text[txtI][0])
                        .font(.title)
                    Text(text[txtI][1])
                        .font(.title)
                }
            }
            Button(action: {
                if (txtI<text.count-2) {txtI+=1}
                else {
                    txtI+=1
                    hideButton = true
                    hideNav = false
                    opacNav = 1
                }
                offset += 500
                opacButton = 0
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { offset-=500
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        opacButton = 1
                    }
                }
            }, label: {
                ZStack{
                    Circle()
                        .foregroundColor(Color.green)
                        .frame(width: 100, height: 100)
                    Text("→")
                        .font(.largeTitle)
                        .foregroundColor(Color.black)
                    
                }
                .offset(x:offset)
                .opacity(opacButton)
                .animation(Animation.easeInOut(duration: 0.7))
            }).isHidden(hideButton)
            NavigationLink(destination: SceneView(), label: {
                ZStack{
                    Circle()
                        .foregroundColor(Color.purple)
                        .frame(width: 100, height: 100)
                    Text("→")
                        .font(.largeTitle)
                        .foregroundColor(Color.black)
                    
                }
            }).isHidden(hideNav)
                .animation(Animation.easeInOut(duration: 0.7))
                .opacity(opacNav)
        }
    }
}
