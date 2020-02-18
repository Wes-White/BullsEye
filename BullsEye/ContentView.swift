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
                HStack {
                    Text("Put the bullseye as close as you can to:" )
                    Text("100")
            
                }
                
                //Slider
                HStack{
                    Text("1")
                    Slider(value: .constant(5))
                    Text("100")
                }
                
                
                
                //Button Row
              Button(action: {
                print("Button pressed!")
                self.alertIsVisible = true
              }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
              }
                
              .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text("Hello there!"), message: Text("This is my first pop-up."), dismissButton: .default(Text("Awesome!")))
              }
                
                //Score Row
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Start Over")
                    }
                    Text("Score:")
                    Text("9999")
                    Text("Round:")
                    Text("999")
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("info")
                    }

                }
                
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
