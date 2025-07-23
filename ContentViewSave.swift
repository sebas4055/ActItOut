//
//  ContentView.swift
//  ActItOut
//
//  Created by Sebastian Molina on 7/21/23.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                
                Spacer()
                Button{
                    text()
                } label: {
                    Image("Mime")
                    .resizable()
                    .frame(width: 100   , height: 100)
                    .padding(.trailing, 250.0)
                }
                
                Spacer()
                
                Image("Wild")
                    .resizable()
                    .frame(width: 100   , height: 100)
                    .padding(.trailing, 250.0)

                Spacer()
                
                Image("Sing")
                    .resizable()
                    .frame(width: 100   , height: 100)                    .padding(.trailing, 250.0)

                Spacer()
                
                Image("Lunch")
                    .resizable()
                    .frame(width: 100   , height: 100)                    .padding(.trailing, 250.0)

                
                Spacer()
                
                Image("Lights")
                    .resizable()
                    .frame(width: 100   , height: 100)                    .padding(.trailing, 250.0)
                        .padding(.bottom, 100.0)
                
            }
            
        }
    }
    
      func text() {
            print(Text("get"))
        }
}
                       
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

