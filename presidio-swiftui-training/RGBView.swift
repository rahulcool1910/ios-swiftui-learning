//
//  RGBView.swift
//  presidio-swiftui-training
//
//  Created by Rahul R on 06/10/23.
//

import SwiftUI

struct RGBView: View {
    @State var red:Double=0.0;
    @State var blue:Double=0.0;
    @State var green:Double=0.0;
    var MAX_VALUE:Double=255;

    var body: some View {
        NavigationView(content: {
            NavigationLink(destination: ContentView()) {
                
                ZStack{
                    Color(red: red / MAX_VALUE, green: green / MAX_VALUE, blue: blue / MAX_VALUE).ignoresSafeArea()
                    
                    VStack {
                        Text("Move the Sliders to change the color").foregroundColor(.white)
                        Spacer()
                        Slider(
                            value: $red,
                            in: 0...255
                            
                        )
                        .accentColor(.red)
                        Slider(
                            value: $green,
                            in: 0...255
                        )
                        .accentColor(.green)
                        Slider(
                            value: $blue,
                            in: 0...255
                        )
                        .accentColor(.blue)
                    }
                    
                    .padding()
                }
            }
        })
        
       
    }
}

#Preview {
    RGBView()
}
