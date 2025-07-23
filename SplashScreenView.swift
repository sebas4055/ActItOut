//
//  ContentView.swift
//  ActItOut
//
//  Created by Sebastian Molina on 7/21/23.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
        
    var body: some View {
        if isActive {
            CoverView()
        } else {
            
            VStack{
                ZStack {
                    Image("background")
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack{
                        Spacer()
                        Image("logo_transparent")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Spacer()
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 2)) {
                            self.size = 1.5
                            self.opacity = 1.0
                        }
                        
                    }
                }
                
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
