//
//  DragDrop.swift
//  
//
//  Created by Madhav Gulati on 4/23/22.
//

import SwiftUI
import AVFoundation

struct Enzyme: View {
    let id: String
    let color:Color
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .foregroundColor(color)
            .frame(width:50, height: 50)
            .onDrag {
                return NSItemProvider(object: self.id as NSString)
            }
    }
}

struct DroppableArea: View {
    @Binding var dropState: Bool
    let point1:Double
    let point2:Double
    let color:Color
    let enz:String
    var body: some View {
        let dropDelegate = EnzymeDropDelegate(dropState:$dropState, enz: enz)
        
        Circle()
            .trim(from: point1, to: point2)
            .stroke(color, style: StrokeStyle(lineWidth: 40, lineCap: .butt))
            .opacity(dropState ? 1.0 : 0.3)
            .frame(width: 400, height: 400)
            .onDrop(of: ["public.text"], delegate: dropDelegate)
    }
}

struct EnzymeDropDelegate: DropDelegate {
    @Binding var dropState: Bool
    var enz: String
    @State var audioPlayer: AVAudioPlayer!
    func performDrop(info: DropInfo) -> Bool {
        
        var result: Bool = false
        
        if let item = info.itemProviders(for: ["public.text"]).first {
            item.loadItem(forTypeIdentifier: "public.text", options: nil) { (text, err) in
                if let data = text as? Data {
                    let inputStr = String(decoding: data, as: UTF8.self)
                    if inputStr == enz {
                        dropState = true
                        result = true
                    }
                    else {
                        result = false
                    }
                }
            }
        }
        
        return result
    }
}
