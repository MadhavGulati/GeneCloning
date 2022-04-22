//
//  SceneView1.swift
//  SwiftChallenge2022
//
//  Created by Madhav Gulati on 4/21/22.
//

import SwiftUI

struct SceneView1: View {
    var body: some View {
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
                    
                    NavigationLink(destination: SceneView()) {
                        RoundRect(text: "Gene From jellyfish", isactive: false)
                    }
                    RoundRect(text: "Cutting out the gene", isactive: true)
                    NavigationLink(destination: SceneView2()) {
                        RoundRect(text: "Insert gene into fish", isactive: false)
                    }
                    Spacer()
                }
            }
            .frame(width: 350, alignment: .leading)
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
                    }
                }
            }
        }
    }
}

