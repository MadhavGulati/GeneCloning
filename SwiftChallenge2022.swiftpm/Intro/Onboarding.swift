//
//  Onboarding.swift
//  SwiftChallenge2022
//
//  Created by Madhav Gulati on 4/21/22.
//

import SwiftUI
import AVFoundation

struct Onboarding: View {
    @Binding var onboardingBool:Bool
    @Environment(\.presentationMode) var presentationMode
    @State var player:AVAudioPlayer? = nil
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                VStack {
                    HStack {
                        Image("fishtank")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width * 0.4)
                            .padding()
                            .padding(.leading, 75)
                        VStack {
                            Spacer()
                            Text("Gene Cloning")
                                .font(.largeTitle)
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .offset(x:-100)
                            Text("TO MAKE A FISH GLOW")
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .offset(x:-100)
                            Spacer()
                        }
                    }
                    NavigationLink(destination: WalkthroughView(onboardingBool: $onboardingBool)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 255/255, green: 177/255, blue: 26/255))
                                .frame(width: 400, height: 75)
                            Text("GET STARTED")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .bold()
                            
                        }
                        .padding(.bottom)
                        .padding(.bottom)
                        .padding(.bottom)
                    }.isDetailLink(false)
                        .padding(.bottom)
                        .padding(.bottom)
                        .padding(.bottom)
                        .simultaneousGesture(TapGesture().onEnded({
                            let url = Bundle.main.url(forResource: "intro", withExtension:"mp3")
                            player = try! AVAudioPlayer(contentsOf: url!)
                            player!.play()
                        }))
                }.background(Rectangle()
                    .irregularGradient(colors: [Color(red: 0.741, green: 0.698, blue: 1), Color(red:1, green: 0.82, blue: 0.4), Color(red:0.937, green: 0.137, blue: 0.235)], backgroundColor: .white, speed: 4)
                    .ignoresSafeArea(.all)
                )
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationTitle(Text(""))
        }
        .onReceive(NotificationCenter.default.publisher(for:Notification.ReturnBack))
        { obj in
            presentationMode.wrappedValue.dismiss()
        }
    }
}

extension Notification {
    static let ReturnBack = Notification.Name.init("ReturnBack")
}
