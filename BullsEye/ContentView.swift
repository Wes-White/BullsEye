//
//  ContentView.swift
//  BullsEye
//
//  Created by Wesley Ryan on 2/6/20.
//  Copyright © 2020 Wesley Ryan. All rights reserved.
//

import SwiftUI

struct ContentView: View {

  @State var alertIsVisible: Bool = false
 
  var body: some View {
    HStack {
        HStack {
            VStack {
                // Target Row
                Spacer()
                HStack {
                    Text("Put the bullseye as close as you can to:" )
                    Text("100")
            
                }
                Spacer()
                
                //Slider
                HStack{
                    Text("1")
                    Slider(value: .constant(5))
                    Text("100")
                }
                
                Spacer()
                
                //Button Row
              Button(action: {
                print("Button pressed!")
                self.alertIsVisible = true
              }) {
                Text("Hit me !!")
              }
                
              .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text("Hello there!"), message: Text("This is my first pop-up."), dismissButton: .default(Text("Awesome!")))
              }
                
                Spacer()
                
                //Score Row
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Start Over")
                    }
                     Spacer()
                    Text("Score:")
                    Text("9999")
                     Spacer()
                    Text("Round:")
                    Text("999")
                     Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("info")
                    }

                }
                .padding(.bottom, 20)
            }
            
        }
        
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().previewLayout(.fixed(width: 896, height: 414))
  }
}
