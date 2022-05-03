//
//  Scene3.swift
//  
//
//  Created by Madhav Gulati on 4/23/22.
//

import SwiftUI
import AVFAudio

struct Scene3:View {
    @State var dropState1:Bool = false
    @State var dropState2:Bool = false
    @State var dropState3:Bool = false
    @State private var nextVar:Bool = false
    @State private var textStr:String = "Great! Now that we have our GFP gene from the jellyfish, it's time to prepare our fish DNA to receive this new gene. Let's use the same restriction enzymes from before to make cuts in the fish DNA. This will give us a gap to introduced the GFP gene into the fish's DNA. Go ahead, you know what to do.."
    @Binding var selected:ActiveScene
    @State var player:AVAudioPlayer? = nil
    var body: some View {
        ScrollView {
            VStack {
                Text("Fish DNA")
                    .font(.largeTitle)
                    .frame(alignment: .leading)
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width:600, height: 500)
                        .foregroundColor(Color.white)
                        .shadow(radius: 6)
                    ZStack {
                        Circle()
                            .stroke(Color.gray, style: StrokeStyle(lineWidth: 10, lineCap: .butt))
                            .frame(width: 400, height: 400)
                        Circle()
                            .trim(from: 0.59, to: 0.91)
                            .stroke(Color.white, style: StrokeStyle(lineWidth: 12, lineCap: .butt))
                            .frame(width: 400, height: 400)
                            .isHidden(!nextVar)
                        DroppableArea(dropState: $dropState1, point1: 0.55, point2: 0.58, color: Color.black, enz: "r3")
                            .isHidden(nextVar)
                        DroppableArea(dropState: $dropState2, point1: 0.92, point2: 0.95, color: Color.blue, enz: "r4")
                            .isHidden(nextVar)
                        DroppableArea(dropState: $dropState3, point1: 0.6, point2: 0.9, color: Color.green, enz: "gfp")
                            .isHidden(!nextVar)
                    }
                }
                Text(textStr)
                    .padding()
                    .padding()
                    .multilineTextAlignment(.center)
                HStack {
                    if (!nextVar) {
                        Enzyme(id: "r3", color: Color.black)
                            .padding()
                        Enzyme(id: "r4", color: Color.blue)
                            .padding()
                    }
                    else {
                        Circle()
                            .trim(from: 0.6, to: 0.9)
                            .stroke(Color.green, style: StrokeStyle(lineWidth: 12, lineCap: .butt))
                            .frame(width: 400, height: 400)
                            .onDrag {
                                return NSItemProvider(object: "gfp" as NSString)
                            }
                    }
                    
                }
                
            }
        }
        .onChange(of: (dropState1)) { _ in
            dropStateChanged()
        }
        .onChange(of: (dropState2)) { _ in
            dropStateChanged()
        }
        .onChange(of: dropState3) { _ in
            let url = Bundle.main.url(forResource: "pop", withExtension:"mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player!.play()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4, execute: {
                if dropState3 {
                    selected = .scene4
                }
            })
        }
    }
    func dropStateChanged() {
        let url = Bundle.main.url(forResource: "pop", withExtension:"mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
        if (dropState1 && dropState2) {
            nextVar = true
            textStr = "Awesome! Now it's time to insert the GFP gene into the fish DNA. Drag and drop the GFP segment below in the indicated area above."
        }
    }
}
