//
//  Walkthrough.swift
//  SwiftChallenge2022
//
//  Created by Madhav Gulati on 4/21/22.
//

import SwiftUI
import AVFoundation

struct WalkthroughView: View {
    @State private var txtI: Int = 0
    @State private var hideButton: Bool = false
    @State private var hideNav: Bool = true
    @Binding var onboardingBool:Bool
    var text = [["Have you ever been to a pet store and seen fish that glow, like the ones in this fish tank?", "Some species of fish are able to glow naturally, but others are a miracle of science where scientists have created these fish that have this quality to glow. So how do they do this?"], ["These fish are changed through **genetic modification**, in which their physical traits are changed.", "The glowing ability of a fish actually comes from a special protein called **Green Fluorescent Protein**, or **GFP**, which is found in jellyfish."], ["Scientists have managed to transfer this GFP protein to other organisms like this fish. This process is called **gene cloning**.", "Want to see how this process works? Click the button below!"]]
    var imagePaths = ["fishtank", "jellyfish", "fishtank"]
    @State var player:AVAudioPlayer? = nil
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .irregularGradient(colors: [Color(red: 0.741, green: 0.698, blue: 1), Color(red: 0.898, green: 0.898, blue: 0.898)], backgroundColor: Color(red: 0.627, green: 0.769, blue: 1)).ignoresSafeArea(.all)
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
                            Text(.init(text[txtI][0]))
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .padding()
                            Text(.init(text[txtI][1]))
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .padding()
                        }
                    }
                    .padding(.top)
                    if (hideNav) {
                        Button {
                            if (txtI<text.count-2) {
                                withAnimation {
                                    txtI+=1
                                    hideButton = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                                    withAnimation {hideButton = false}
                                })
                            }
                            else {
                                txtI+=1
                                withAnimation {
                                    hideNav = false
                                }
                            }
                            
                        } label: {
                            ZStack{
                                Circle()
                                    .foregroundColor(Color.green)
                                    .frame(width: 100, height: 100)
                                Text("→")
                                    .font(.largeTitle)
                                    .foregroundColor(Color.black)
                                
                            }
                        }
                        .padding(.bottom)
                        .padding(.bottom)
                        .isHidden(hideButton)
                    }
                    Button {
                        let url = Bundle.main.url(forResource: "start", withExtension:"mp3")
                        player = try! AVAudioPlayer(contentsOf: url!)
                        player!.play()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                            onboardingBool = false
                        })
                    } label: {
                        ZStack{
                            Circle()
                                .foregroundColor(Color.purple)
                                .frame(width: 100, height: 100)
                            Text("→")
                                .font(.largeTitle)
                                .foregroundColor(Color.black)
                        }
                    }
                    .isHidden(hideNav)
                    .padding(.bottom)
                    .transition(.asymmetric(insertion: .slide, removal: .offset(y:-500)))
                }
            }
        }
    }
}

struct BgrndGradient: View {
    
    
    static let color0 = Color(red: 255/255, green: 254/255, blue: 204/255);
    
    static let color1 = Color(red: 230/255, green: 252/255, blue: 255/255);
    
    static let color2 = Color(red: 240/255, green: 203/255, blue: 240/255);
    
    
    let gradient = Gradient(colors: [color0, color1, color2]);
    var body: some View {
        LinearGradient(gradient: gradient,startPoint: .init(x: 0.00, y: 0.50),endPoint: .init(x: 1.00, y: 0.50))
    }
}
