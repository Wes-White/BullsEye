//
//  ContentView.swift
//  Bullseye
//
//  Created by Ray Wenderlich on 8/20/19.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    struct LabelStyle: ViewModifier{
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.white)
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)
            .font(Font.custom("Arial Rounded MT Bold", size: 19))
        }
    }
    
    struct ValueStyle: ViewModifier{
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.yellow)
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
    }
    
    
    var body: some View {
        VStack {
            Spacer()
            
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:").modifier(LabelStyle())
                Text("\(self.target)").modifier(ValueStyle())
                
            }
            Spacer()
            
            // Slider row
            HStack {
                Text("1").modifier(LabelStyle())
                
                Slider(value: self.$sliderValue, in: 1...100)
                
                Text("100").modifier(LabelStyle())
            }
            Spacer()
            
            // Button row
            Button(action: {
                print("Button pressed!")
                self.alertIsVisible = true
                
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                
                return Alert(title: Text("\(alertTitle())"), message: Text(
                    "The slider's value is \(sliderValueRounded()).\n" +
                    "You scored \(self.pointsForCurrentRound()) points this round."
                    ), dismissButton: .default(Text("Awesome!")) {
                        self.score = self.score + self.pointsForCurrentRound()
                        self.target = Int.random(in: 1...100)
                        self.round = self.round + 1
                    })
            }
            Spacer()
            
            // Score row
            HStack {
                Button(action: {
                    self.resetGame()
                }) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())
                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                Spacer()
                Button(action: {}) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
        .background(Image("Background"), alignment: .center
        )
    }
    func sliderValueRounded() -> Int {
        return Int(self.sliderValue.rounded())
    }
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let maxScore = 100
        let difference = amountOff()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        
        return maxScore - difference + bonus
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func resetGame() {
        self.round = 1
        self.score = 0
        self.target = Int.random(in: 1...100)
        sliderValue = 50.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}


