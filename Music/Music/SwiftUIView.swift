//
//  SwiftUIView.swift
//  Music
//
//  Created by Ocean Chen on 2/11/25.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var like = false
    @State private var shuffle = false
    @State private var pause = true
    @State private var replay = false
    @State private var currentTime: Double = 11
    let totalTime = 153
    var body: some View {
        ZStack{
            Color.cyan
                .ignoresSafeArea()
            VStack{
                HStack{
                    Image(systemName :"chevron.down")
                    Spacer()
                    Text("晚安")
                    Spacer()
                    Image(systemName: "ellipsis")
                }.padding(.horizontal,8)
                Spacer()
                Image("sky")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .frame(width: 350)
                    .padding(16)
                HStack{
                    VStack{
                        Text("做自己的光")
                            .bold()
                            .foregroundColor(.black)
                            .font(.title3)
                        Text("善宇")
                            .font(.subheadline)
                    }
                    Spacer()
                    Button(action: {like.toggle()}){
                        Image(systemName: like ? "heart.fill" : "heart")
                            .font(.title)
                            .foregroundColor(like ? .red : .black)
                    }
                }.padding(.horizontal,12)
                Slider(value: $currentTime, in: 0...Double(totalTime), onEditingChanged:
                        { _ in seekToTime(currentTime)})
                .accentColor(.white)
                .padding(.horizontal)
                HStack {
                    Text(formattedTime(currentTime))
                        .padding(.horizontal,12)
                    Spacer()
                    Text("-\(formattedTime(Double(totalTime) - currentTime))")
                        .padding(.horizontal,12)
                }
                    HStack{
                        Button(action: {shuffle.toggle()}){
                            Image(systemName: shuffle ? "shuffle.circle.fill   %" : "shuffle")
                                .font(.system(size: 25))
                            .foregroundColor(shuffle ? .blue : .black)}
                        Spacer()
                        Image(systemName: "backward.end")
                            .font(.system(size: 40))
                            .foregroundColor(Color.secondary)
                        Button(action: {pause.toggle()}){
                            Image(systemName: pause ? "pause.circle.fill" : "play.circle.fill")
                                .font(.system(size: 60))
                        }
                        .foregroundColor(.white)
                        Image(systemName: "forward.end")
                            .font(.system(size: 40))
                            .foregroundColor(Color.secondary)
                        Spacer()
                        Button(action: {replay.toggle()}){
                            Image(systemName: replay ? "repeat" : "repeat")
                                .font(.system(size: 25))
                            .foregroundColor(replay ? .blue : .black)}
                    }
                    .padding(.horizontal, 18)
                    Spacer()
                    HStack{
                        Image(systemName: "airplay.audio")
                        Spacer()
                        Image(systemName: "square.and.arrow.up")
                        Image(systemName: "square.stack.3d.up")
                    }
                    .font(.system(size: 22))
                    .padding(.horizontal, 16)
                }
            }
        }
    }
func formattedTime(_ time: Double) -> String {
    let minutes = Int(time) / 60
    let seconds = Int(time) % 60
    return String(format: "%02d:%02d", minutes, seconds)}
func seekToTime(_ time: Double) {
    print("Seeking to \(formattedTime(time))")
}
#Preview {
SwiftUIView()
}
