//
//  Scene2.swift
//  
//
//  Created by Madhav Gulati on 4/23/22.
//

import SwiftUI

struct Scene2:View {
    @State private var nextVar:Bool = false
    @State private var textLbl:String = "Awesome! You have now cut the gene from the jellyfish DNA. Let's take a closer look at these cuts."
    @State private var pressCounter:Int = 0
    @State private var nextBtnShow:Bool = true
    @Binding var selected:ActiveScene
    var body: some View {
        ScrollView {
            VStack {
                Text("Closer look at Restriction Enzymes")
                    .font(.largeTitle)
                    .frame(alignment: .leading)
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width:600, height: 500)
                        .foregroundColor(Color.white)
                        .shadow(radius: 6)
                        .padding(.horizontal)
                    if (!nextVar) {
                        ZStack {
                            Circle()
                                .stroke(Color.gray, style: StrokeStyle(lineWidth: 10, lineCap: .butt))
                                .frame(width: 400, height: 400)
                            Circle()
                                .trim(from: 0.6, to: 0.9)
                                .stroke(Color.green, style: StrokeStyle(lineWidth: 12, lineCap: .butt))
                                .frame(width: 400, height: 400)
                            Circle()
                                .trim(from: 0.59, to: 0.6)
                                .stroke(Color.white, style: StrokeStyle(lineWidth: 12, lineCap: .butt))
                                .frame(width: 400, height: 400)
                            Circle()
                                .trim(from: 0.9, to: 0.91)
                                .stroke(Color.white, style: StrokeStyle(lineWidth: 12, lineCap: .butt))
                                .frame(width: 400, height: 400)
                        }}
                    else {
                        HStack {
                            CutOne().foregroundColor(Color.gray)
                                .frame(width: 250, height:50)
                            CutTwo().foregroundColor(Color.green)
                                .frame(width: 250, height:50)
                        }}
                }
                Text(textLbl)
                    .padding()
                    .padding()
                    .multilineTextAlignment(.center)
                Button {
                    if pressCounter == 1 {
                        selected = .scene3
                        pressCounter = 0
                    }
                    else {
                        pressCounter += 1
                        nextBtnShow = false
                        nextVar = true
                        withAnimation(.easeInOut(duration: 0.5), {
                            textLbl = "DNA is double stranded (made up of 2 'strands' joined together). Some restriction enzymes, like the ones you just used, cut so that one strand of the DNA is longer than the other. This leaves an overhang, called a 'sticky end', which allow genes with matching sticky ends to join easily."
                        })
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            nextBtnShow=true
                        }
                        
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
                .transition(.opacity)
                .isHidden(!nextBtnShow)
                
            }
        }
    }
}
