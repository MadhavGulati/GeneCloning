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
    @State private var opacNav: Double = 0
    @Binding var onboardingBool:Bool
    var text = [["Have you ever been to a pet store and seen a glowing fish such as this one?", "These fish cannot glow naturally. So how do they become like this?"], ["Some of these fish are changed through genetic modification, in which their physical traits are changed.", "The glowing ability of a fish actually comes from a a special protein called Green Fluorescent Protein, or GFP, in jellyfish."], ["Scientists have been able to transfer this GFP protein to other organisms. This process is called gene cloning.", "Click below to see how this process works!"]]
    var imagePaths = ["fishtank", "jellyfish", "fishtank"]
    var body: some View {
        GeometryReader { geo in
            ZStack {
                BgrndGradient().frame(width:geo.size.width, height:geo.size.height).ignoresSafeArea(.all)
                VStack {
                    Text("Gene Cloning")
                        .font(.largeTitle)
                    HStack {
                        Image(imagePaths[txtI])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width * 0.4)
                            .padding()
                            .padding()
                        VStack {
                            Text(text[txtI][0])
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .padding()
                            Text(text[txtI][1])
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .padding()
                        }
                    }
                    .padding(.top)
                    Button(action: {
                        if (txtI<text.count-2) {txtI+=1}
                        else {
                            txtI+=1
                            opacButton = 0
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                hideButton = true
                                hideNav = false
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                opacNav = 1
                            }
                        }
                        offset += 500
                        opacButton = 0
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { offset-=500
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
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
                    Button {
                        onboardingBool=false
                    } label: {
                        ZStack{
                            Circle()
                                .foregroundColor(Color.purple)
                                .frame(width: 100, height: 100)
                            Text("→")
                                .font(.largeTitle)
                                .foregroundColor(Color.black)
                        }
                    }.isHidden(hideNav)
                        .padding(.bottom)
                        .opacity(opacNav)
                        .animation(Animation.easeInOut(duration: 0.7))
                }
            }
        }
    }
}

struct BgrndGradient: View {
    
    
    static let color0 = Color(red: 114/255, green: 139/255, blue: 255/255);
    
    static let color1 = Color(red: 0/255, green: 188/255, blue: 212/255);
    
    static let color2 = Color(red: 238/255, green: 130/255, blue: 238/255);
    
    
    let gradient = Gradient(colors: [color0, color1, color2]);
    var body: some View {
        LinearGradient(gradient: gradient,startPoint: .init(x: 0.00, y: 0.50),endPoint: .init(x: 1.00, y: 0.50))
    }
}
