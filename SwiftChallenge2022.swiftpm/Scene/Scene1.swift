//
//  Scene1.swift
//  
//
//  Created by Madhav Gulati on 4/23/22.
//

import SwiftUI
import AVFoundation

struct Scene1:View {
    @State var dropState1:Bool = false
    @State var dropState2:Bool = false
    @Binding var selected:ActiveScene
    @State private var textStr:String = "Let's pretend that the above circle is the DNA of a jellyfish, and the green segment of the circle is the gene for GFP. Now, let's extract this gene out of the jellyfish by cutting it."
    @State private var nextBtnShow:Bool = true
    @State private var pressCounter:Int = 0
    @State private var showVar:Bool = false
    @State var player:AVAudioPlayer? = nil
    var body: some View {
        ScrollView {
            VStack {
                Text("Jellyfish DNA")
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
                            .trim(from: 0.6, to: 0.9)
                            .stroke(Color.green, style: StrokeStyle(lineWidth: 12, lineCap: .butt))
                            .frame(width: 400, height: 400)
                        DroppableArea(dropState: $dropState1, point1: 0.55, point2: 0.58, color: Color.black, enz: "r1")
                        DroppableArea(dropState: $dropState2, point1: 0.92, point2: 0.95, color: Color.blue, enz: "r2")
                    }
                }
                Text(textStr)
                    .multilineTextAlignment(.center)
                    .padding()
                    .transition(.opacity)
                if (showVar) {
                    HStack {
                        Enzyme(id: "r1", color: Color.black)
                            .padding()
                        Enzyme(id: "r2", color: Color.blue)
                            .padding()
                    }
                }
                Button {
                    if pressCounter == 1 {
                        pressCounter = 0
                    }
                    else {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            nextBtnShow = false
                        }
                        withAnimation(.easeInOut(duration: 1.0), {
                            textStr = "Scientists use special proteins called restriction enzymes to cut DNA. Try dragging these restriction enzymes onto the marked locations on the DNA now! (Press and hold to start dragging, then drop when you see the + sign.)"
                            showVar = true
                            pressCounter += 1
                        })
                    }
                } label: {
                    ZStack{
                        Circle()
                            .foregroundColor(Color.green)
                            .frame(width: 100, height: 100)
                        Text("→")
                            .padding()
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                            .transition(.opacity)
                    }
                }
                .padding()
                .padding()
                .isHidden(!nextBtnShow)
                .transition(.opacity)
            }
        }
        .onChange(of: dropState1) { _ in
            dropStateChanged()
        }
        .onChange(of: dropState2) { _ in
            dropStateChanged()
        }
    }
    func dropStateChanged() {
        let url = Bundle.main.url(forResource: "pop", withExtension:"mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            if (dropState1 && dropState2) {
                selected = .scene2
            }
        })
    }
}
