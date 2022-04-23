//
//  SceneView.swift
//  SwiftChallenge2022
//
//  Created by Madhav Gulati on 4/21/22.
//

import SwiftUI

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
            //NavigationView {
            HStack {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 0.98, green: 0.98, blue: 0.98))
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
                        RoundRect(scene: .scene3, text: "See your fish!", selected: $selected)
                        Spacer()
                        ZStack {
                            Button {
                                onboardingBool = true
                            } label: {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(red: 0.98, green: 0.98, blue: 0.98))
                                    .frame(width: 258, height: 56)
                                    .shadow(color:Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 4)
                                    .padding([.top])
                                Text("↻")
                                    .padding(.top)
                                    .font(.title3)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 258, height: 56)
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
                }.frame(width: geo.size.width * 0.7)
                
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
}

struct Scene1:View {
    @State var dropState1:Bool = false
    @State var dropState2:Bool = false
    @Binding var selected:ActiveScene
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
                Text("Let's pretend that the above circle is the DNA of a jellyfish. The green ring that you see inside the circle is the gene for GFP. Now, let's try to take this gene out of the DNA of the jellyfish by cutting it.")
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Scientists use special proteins called restriction enzymes to cut DNA. Try dragging these restriction enzymes onto the marked locations on the gene now!")
                    .multilineTextAlignment(.center)
                    .padding()
                Text("(Press and hold the enzymes below and drag them to the matching color on the DNA.)")
                    .multilineTextAlignment(.center)
                    .padding()
                HStack {
                    Enzyme(id: "r1", color: Color.black)
                        .padding()
                        .padding()
                        .padding()
                    Enzyme(id: "r2", color: Color.blue)
                        .padding()
                        .padding()
                        .padding()
                }
                
            }
        }
        .onChange(of: dropState1) { _ in
            if (dropState1 && dropState2) {
                selected = .scene2
            }
        }
        .onChange(of: dropState2) { _ in
            if (dropState1 && dropState2) {
                selected = .scene2
            }
        }
    }
}

struct Scene2:View {
    @State private var nextVar:Bool = false
    @State private var textLbl:String = "Awesome!! You have now cut out a gene from the fish DNA. Let's take a closer look at these cuts."
    @State private var nextBtnOpacity:Double = 1
    @State private var textOpacity:Double = 1
    @State private var pressCounter:Int = 0
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
                    }
                }
                Text(textLbl)
                    .padding()
                    .multilineTextAlignment(.center)
                Button {
                    if pressCounter == 1 {
                        selected = .scene3
                        pressCounter = 0
                    }
                    else {
                        pressCounter += 1
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            nextBtnOpacity = 0
                            
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation(.easeInOut(duration: 0.5), {
                                textOpacity = 0
                            })
                            textLbl = "DNA is double stranded, which means it is made up of 2 'strands' that are joined together. Some restriction enzymes, such as the ones you just used, cut so that one strand of DNA is longer than the other. This leaves an overhang, called a 'sticky end'."
                            
                            withAnimation(.easeInOut(duration: 1.0), {
                                textOpacity = 1
                            })
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                            nextBtnOpacity = 1
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
                            .opacity(textOpacity)
                            .transition(.opacity)
                            .animation(Animation.easeInOut(duration: 0.7))
                    }
                }
                .padding()
                .padding()
                .opacity(nextBtnOpacity)
                .animation(Animation.easeInOut(duration: 0.7))
                
            }
        }
    }
}

struct Scene3:View {
    @State var dropState1:Bool = false
    @State var dropState2:Bool = false
    @State var dropState3:Bool = false
    @State private var nextVar:Bool = false
    @State private var textStr:String = "Great! We now have our GFP gene from the jellyfish. Now, above we have the DNA of our fish. Let's use the same restriction enzymes from before to make cuts in the fish DNA. This will give us a gap to put the GFP gene into the fish's DNA."
    @Binding var selected:ActiveScene
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
                    .multilineTextAlignment(.center)
                HStack {
                    Enzyme(id: "r3", color: Color.black)
                        .isHidden(nextVar)
                    Enzyme(id: "r4", color: Color.blue)
                        .isHidden(nextVar)
                    Circle()
                        .trim(from: 0.6, to: 0.9)
                        .stroke(Color.green, style: StrokeStyle(lineWidth: 12, lineCap: .butt))
                        .frame(width: 400, height: 400)
                        .onDrag {
                            return NSItemProvider(object: "gfp" as NSString)
                        }
                        .isHidden(!nextVar)
                    
                }
                
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
        .onChange(of: (dropState1 && dropState2)) { _ in
            if (dropState1 && dropState2) {
                nextVar = true
                textStr = "Awesome! Now insert the GFP gene into the fish DNA by dragging and dropping."
            }
        }
        .onChange(of: dropState3) { _ in
            if dropState3 {
                selected = .scene4
            }
        }
    }
}

struct Scene4:View {
    @Binding var selected:ActiveScene
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
                        Image("fishtank")
                    }
                }
                Text("Congratulations!")
                    .padding()
                    .multilineTextAlignment(.center)
                
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
    }
}


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
            .stroke(color, style: StrokeStyle(lineWidth: 30, lineCap: .butt))
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
    let scene:ActiveScene
    let text: String
    @Binding var selected:ActiveScene
    var body: some View {
        Button {
            if scene == .scene1 {selected = .scene1}
            else if scene == .scene2 {selected = .scene2}
            else if scene == .scene3 {selected = .scene3}
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(selected == scene ? Color(red: 1, green: 1, blue: 1) : Color(red: 0.98, green: 0.98, blue: 0.98))
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
