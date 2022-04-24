//
//  SceneView.swift
//  SwiftChallenge2022
//
//  Created by Madhav Gulati on 4/21/22.
//

import SwiftUI
import AVFoundation
import SpriteKit
import RealityKit

enum ActiveScene {
    case scene1
    case scene2
    case scene3
    case scene4
}

struct SceneView: View {
    @State var selected:ActiveScene = .scene1
    @Binding var onboardingBool:Bool
    var body: some View {
        GeometryReader { geo in
            HStack {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 0.94, green: 0.94, blue: 0.94))
                        .ignoresSafeArea(.all)
                    VStack {
                        Text("Gene Cloning")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .frame(width: 258, height: 81, alignment: .top)
                            .padding(.top)
                            .padding(.top)
                            .padding(.top)
                        RoundRect(scene: .scene1, text: "Gene From jellyfish", selected: $selected)
                        RoundRect(scene: .scene2, text: "Cutting out the gene", selected: $selected)
                        RoundRect(scene: .scene3, text: "Insert gene into fish", selected: $selected)
                        RoundRect(scene: .scene4, text: "See your fish!", selected: $selected)
                        Spacer()
                        ZStack {
                            Button {
                                onboardingBool = true
                                NotificationCenter.default.post(name: Notification.ReturnBack,object: nil)
                            } label: {
                                Text("Restart ↻")
                                    .font(.title3)
                                    .frame(width: 258, height: 56)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color(red: 0.94, green: 0.94, blue: 0.94))
                                            .frame(width: 258, height: 56)
                                            .shadow(color:Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 4))
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .padding(.bottom)
                    }
                }
                .frame(width: geo.size.width * 0.3)
                Group {
                    if (selected == .scene1) {Scene1(selected: $selected)}
                    else if (selected == .scene2) {Scene2(selected: $selected)}
                    else if (selected == .scene3) {Scene3(selected: $selected)}
                    else if (selected == .scene4) {Scene4(selected: $selected)}
                }.frame(width: geo.size.width * 0.7)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
}


struct RoundRect: View {
    let scene:ActiveScene
    let text: String
    @Binding var selected:ActiveScene
    var body: some View {
        Button {
            if scene == .scene1 {selected = .scene1}
            else if scene == .scene2 {selected = .scene2}
            else if scene == .scene3 {selected = .scene3}
            else if scene == .scene4 {selected = .scene4}
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(selected == scene ? Color(red: 1, green: 1, blue: 1) : Color(red: 0.94, green: 0.94, blue: 0.94))
                    .frame(width: 258, height: 56)
                    .shadow(color: selected == scene ? Color(red: 0, green: 0, blue: 0, opacity: 0.15) : Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: selected == scene ? 5 : 4)
                    .padding([.top])
                Text(text)
                    .padding(.top)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .frame(width: 258, height: 56)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct CutOne: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0.67485*width, y: 0))
        path.addLine(to: CGPoint(x: 0.67485*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: width, y: 0.5*height))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.closeSubpath()
        return path
    }
}

struct CutTwo: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0.32515*width, y: height))
        path.addLine(to: CGPoint(x: 0.32515*width, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width, y: height))
        path.closeSubpath()
        return path
    }
}

//This code comes from the blog post linked below and used to create confetti upon the user finishing the steps of gene cloning
//https://betterprogramming.pub/creating-confetti-particle-effects-using-swiftui-afda4240de6b
struct FireworkParticlesGeometryEffect : GeometryEffect {
    var time : Double
    var speed = Double.random(in: 20 ... 200)
    var direction = Double.random(in: -Double.pi ...  Double.pi)
    
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation = speed * cos(direction) * time
        let yTranslation = speed * sin(direction) * time
        let affineTranslation =  CGAffineTransform(translationX: xTranslation, y: yTranslation)
        return ProjectionTransform(affineTranslation)
    }
}
struct ParticlesModifier: ViewModifier {
    @State var time = 0.0
    @State var scale = 0.1
    let duration = 5.0
    
    func body(content: Content) -> some View {
        ZStack {
            ForEach(0..<80, id: \.self) { index in
                content
                    .hueRotation(Angle(degrees: time * 80))
                    .scaleEffect(scale)
                    .modifier(FireworkParticlesGeometryEffect(time: time))
                    .opacity(((duration-time) / duration))
            }
        }
        .onAppear {
            withAnimation (.easeOut(duration: duration)) {
                self.time = duration
                self.scale = 1.0
            }
        }
    }
}
