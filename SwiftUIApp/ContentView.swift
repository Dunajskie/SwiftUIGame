//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by Michał Dunajski on 01/09/2021.
//

import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var guess: RGB
    @State var showScore = false
    let circleSize: CGFloat = 0.5
    let labelWidth: CGFloat = 0.53
    let labelHeight: CGFloat = 0.06
    let buttonWidth: CGFloat = 0.87
    
    var body: some View {
        GeometryReader { geometry in
          ZStack {
              Color.element
                .edgesIgnoringSafeArea(.all)
            VStack {
                ColorCircle(rgb: game.target, size: geometry.size.width * circleSize)
                VStack {
                    if !showScore {
                      BevelText(
                        text: "R: ??? G: ??? B: ???",
                        width: geometry.size.width * labelWidth,
                        height: geometry.size.height * labelHeight)
                    } else {
                      BevelText(
                        text: game.target.intString(),
                        width: geometry.size.width * labelWidth,
                        height: geometry.size.height * labelHeight)
                    }
                }
                ColorCircle(rgb: guess, size: geometry.size.width * circleSize)
                BevelText(text: guess.intString(),
                          width: geometry.size.width * labelWidth,
                          height: geometry.size.height * labelHeight)
                VStack {
                    ColorSlider(value: $guess.red, trackColor: .red)
                    ColorSlider(value: $guess.green, trackColor: .green)
                    ColorSlider(value: $guess.blue, trackColor: .blue)
                }
                .font(.subheadline)
                Button("Hit Me!") {
                  showScore = true
                  game.check(guess: guess)
                }
                .buttonStyle((NeuButtonStyle(
                                width: geometry.size.width * buttonWidth,
                                height: geometry.size.height * labelHeight)))
                .alert(isPresented: $showScore) {
                  Alert(
                    title: Text("Your Score"),
                    message: Text(String(game.scoreRound)),
                    dismissButton: .default(Text("OK")) {
                      game.startNewRound()
                      guess = RGB()
                    })
                }
            }
            .font(.headline)
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(guess: RGB())
            ContentView(guess: RGB())
                .previewDevice("iPhone 8")
        }
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var trackColor: Color
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value)
              .accentColor(trackColor)
            Text("255")
        }
        .padding(.horizontal)
    }
}

