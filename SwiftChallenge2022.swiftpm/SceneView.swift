//
//  SceneView.swift
//  SwiftChallenge2022
//
//  Created by Madhav Gulati on 4/21/22.
//

import SwiftUI

struct SceneView: View {
    var body: some View {
        //NavigationView {
        HStack {
            ZStack {
                Rectangle()
                    .fill(Color(red: 0.98, green: 0.98, blue: 0.98))
                    .frame(width: 327, height: 834)
                VStack {
                    Text("Gene Cloning")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .frame(width: 258, height: 81, alignment: .top)
                        .padding(.top)
                        .padding(.top)
                        .padding(.top)
                    RoundRect(text: "Gene From jellyfish", isactive: true)
                    NavigationLink(destination: SceneView1()) {
                        RoundRect(text: "Cutting out the gene", isactive: false)
                    }
                    NavigationLink(destination: SceneView2()) {
                        RoundRect(text: "Insert gene into fish", isactive: false)
                    }
                    Spacer()
                }
            }
            .frame(width: 350, alignment: .leading)
            ScrollView {
                VStack {
                    Text("Jellyfish DNA")
                        .font(.largeTitle)
                        .frame(alignment: .leading)
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width:700, height: 600)
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
                            DroppableArea(dropState: $dropState1, point1: 0.56, point2: 0.58, color: Color.black, enz: "r1")
                            DroppableArea(dropState: $dropState2, point1: 0.92, point2: 0.94, color: Color.blue, enz: "r2")
                        }
                    }
                    Text("Let's pretend that the above circle is the DNA of a jellyfish. The green ring that you see inside the circle is the gene for GFP. Now, let's try to take this gene out of the DNA of the jellyfish by cutting it.")
                        .multilineTextAlignment(.center)
                    Text("Scientists use special proteins called restriction enzymes to cut DNA. Try dragging these restriction enzymes onto the marked locations on the gene now!")
                        .multilineTextAlignment(.center)
                    HStack {
                        Enzyme(id: "r1", color: Color.black)
                        Enzyme(id: "r2", color: Color.blue)
                    }
                    
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
            .onChange(of: dropState1) { _ in
                if (dropState1 && dropState2) {
                    print("they are equal")
                }
            }
            .onChange(of: dropState2) { _ in
                if (dropState1 && dropState2) {
                    print("they are equal")
                }
            }
        //}
            //.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Scene1:View {
    @State var dropState1:Bool = false
    @State var dropState2:Bool = false
    var body: some View {
        ScrollView {
            VStack {
                Text("Jellyfish DNA")
                    .font(.largeTitle)
                    .frame(alignment: .leading)
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width:700, height: 600)
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
                        DroppableArea(dropState: $dropState1, point1: 0.56, point2: 0.58, color: Color.black, enz: "r1")
                        DroppableArea(dropState: $dropState2, point1: 0.92, point2: 0.94, color: Color.blue, enz: "r2")
                    }
                }
                Text("Let's pretend that the above circle is the DNA of a jellyfish. The green ring that you see inside the circle is the gene for GFP. Now, let's try to take this gene out of the DNA of the jellyfish by cutting it.")
                    .multilineTextAlignment(.center)
                Text("Scientists use special proteins called restriction enzymes to cut DNA. Try dragging these restriction enzymes onto the marked locations on the gene now!")
                    .multilineTextAlignment(.center)
                HStack {
                    Enzyme(id: "r1", color: Color.black)
                    Enzyme(id: "r2", color: Color.blue)
                }
                
            }
        }
    }
}

struct Scene2:View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Jellyfish DNA")
                    .font(.largeTitle)
                    .frame(alignment: .leading)
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width:700, height: 600)
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
                        DroppableArea(dropState: $dropState1, point1: 0.56, point2: 0.58, color: Color.black, enz: "r1")
                        DroppableArea(dropState: $dropState2, point1: 0.92, point2: 0.94, color: Color.blue, enz: "r2")
                    }
                }
                Text("Let's pretend that the above circle is the DNA of a jellyfish. The green ring that you see inside the circle is the gene for GFP. Now, let's try to take this gene out of the DNA of the jellyfish by cutting it.")
                    .multilineTextAlignment(.center)
                Text("Scientists use special proteins called restriction enzymes to cut DNA. Try dragging these restriction enzymes onto the marked locations on the gene now!")
                    .multilineTextAlignment(.center)
                HStack {
                    Enzyme(id: "r1", color: Color.black)
                    Enzyme(id: "r2", color: Color.blue)
                }
                
            }
        }
    }
}

struct Scene3:View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Jellyfish DNA")
                    .font(.largeTitle)
                    .frame(alignment: .leading)
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width:700, height: 600)
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
                        DroppableArea(dropState: $dropState1, point1: 0.56, point2: 0.58, color: Color.black, enz: "r1")
                        DroppableArea(dropState: $dropState2, point1: 0.92, point2: 0.94, color: Color.blue, enz: "r2")
                    }
                }
                Text("Let's pretend that the above circle is the DNA of a jellyfish. The green ring that you see inside the circle is the gene for GFP. Now, let's try to take this gene out of the DNA of the jellyfish by cutting it.")
                    .multilineTextAlignment(.center)
                Text("Scientists use special proteins called restriction enzymes to cut DNA. Try dragging these restriction enzymes onto the marked locations on the gene now!")
                    .multilineTextAlignment(.center)
                HStack {
                    Enzyme(id: "r1", color: Color.black)
                    Enzyme(id: "r2", color: Color.blue)
                }
                
            }
        }
    }
}


struct Enzyme: View {
    let id: String
    let color:Color
    var body: some View {
        Rectangle()
            .frame(width:30, height: 30)
            .foregroundColor(color)
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
            .stroke(color, style: StrokeStyle(lineWidth: 25, lineCap: .butt))
            .opacity(dropState ? 1.0 : 0.3)
            .frame(width: 400, height: 400)
            .onDrop(of: ["public.text"], delegate: dropDelegate)
    }
}

struct EnzymeDropDelegate: DropDelegate {
    @Binding var dropState: Bool
    var enz: String
    
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


struct RoundRect: View {
    let text: String
    let isactive: Bool
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 10)
                .fill(isactive ? Color(red: 1, green: 1, blue: 1) : Color(red: 0.98, green: 0.98, blue: 0.98))
                .frame(width: 258, height: 56)
                .shadow(color: isactive ? Color(red: 0, green: 0, blue: 0, opacity: 0.15) : Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: isactive ? 5 : 4)
                .padding([.top])
            Text(text)
                .padding(.top)
                .font(.title3)
                .multilineTextAlignment(.center)
                .frame(width: 258, height: 56)
        }
    }
}
