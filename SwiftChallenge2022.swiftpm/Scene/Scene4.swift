//
//  Scene4.swift
//  
//
//  Created by Madhav Gulati on 4/23/22.
//

import SwiftUI
import SpriteKit
import ARKit
import RealityKit
import AVFoundation

struct Scene4:View {
    @Binding var selected:ActiveScene
    @State var player:AVAudioPlayer? = nil
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 500, height: 400)
        scene.scaleMode = .fill
        return scene
    }
    var body: some View {
        ScrollView {
            VStack {
                Text("See your fish!")
                    .font(.largeTitle)
                    .frame(alignment: .leading)
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width:600, height: 500)
                        .foregroundColor(Color.white)
                        .shadow(radius: 6)
                    ZStack {
                        SpriteView(scene: self.scene)
                            .frame(width: 500, height: 400)
                            .ignoresSafeArea()
                    }
                }
                Text("Congratulations! You have successfully cloned a GFP gene from a jellyfish to a fish!")
                    .padding()
                    .multilineTextAlignment(.center)
                ARView().frame(width: 500, height: 500)
            }
            Circle()
                .fill(Color.blue)
                .frame(width: 12, height: 12)
                .modifier(ParticlesModifier())
                .offset(x: -100, y : -50)
            
            Circle()
                .fill(Color.red)
                .frame(width: 12, height: 12)
                .modifier(ParticlesModifier())
                .offset(x: 60, y : 70)
        }
        .onAppear {
            let url = Bundle.main.url(forResource: "pop", withExtension:"mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player!.play()
        }
    }
}

struct ARView:UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let sceneView = ARSCNView()
        sceneView.showsStatistics = true
        
        let paths = Bundle.main.paths(forResourcesOfType: "scn", inDirectory: nil)
        print(paths)
        
        let scene = SCNScene(named: "ship.scn")!
        sceneView.scene = scene
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        return sceneView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
