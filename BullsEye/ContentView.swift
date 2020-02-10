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
    @State var whoIsThereVisible: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                self.whoIsThereVisible = true
            }) {
                
                Text(/*@START_MENU_TOKEN@*/"Knock Knock.."/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.red)
            }
            .alert(isPresented: $whoIsThereVisible){ () ->
                Alert in
                return Alert(title: Text("Who's There?" ), message: Text("This is my knock konk joke, I hope you had a lil laugh if not... alls well"), dismissButton: .default(Text("Dismiss")))
            }
            VStack {
                
                Text("BullsEye")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.green)
                Button(action: {
                    print("Button pressed" )
                    self.alertIsVisible = true
                    })
                {
                    Text(/*@START_MENU_TOKEN@*/"Hit me!"/*@END_MENU_TOKEN@*/)
                }
                .alert(isPresented: $alertIsVisible) { () ->
                    Alert in
                    return Alert(title: Text("Hello there!" ), message: Text("This is my first popup"), dismissButton: .default(Text("Awesome!")))
                }
              
                          
            }
        }
     }
 }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
