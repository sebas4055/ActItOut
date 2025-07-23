//
//  PostGameView.swift
//  ActItOut
//
//  Created by Sebastian Molina on 8/8/23.
//

import SwiftUI

struct PostGameView: View {
    
    @Binding var isOn:Bool
    
    @Binding var gameTime:Bool
    
    @Binding var mime: Bool
    @Binding var wild: Bool
    @Binding var sing: Bool
    @Binding var lunch: Bool
    @Binding var lights: Bool
    @Binding var feeling: Bool
    @Binding var legends: Bool
    @Binding var spotlight: Bool
    @Binding var once: Bool
    
    @Binding var rightWords: String
    @Binding var wrongWords: String
    
    
    @Binding var mimeS: Bool
    @Binding var wildS: Bool
    @Binding var singS: Bool
    @Binding var lunchS: Bool
    @Binding var lightsS: Bool
    @Binding var feelingS: Bool
    @Binding var legendsS: Bool
    @Binding var spotlightS: Bool
    @Binding var onceS: Bool
    
    
    @Binding var english: Bool
    @Binding var spanish: Bool
    
    @Binding var score: Int
    
    @State var totalText = "Total Words"
    @State var scoreText = "Score"
    
    @Binding var totalWords: Int
        
    @State var size: CGFloat = 40
    
    var body: some View {
        
        ZStack{
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Spacer()

                ZStack{
                    HStack {
                        Image(systemName: "arrowshape.backward.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 45))
                            .onTapGesture {
                                HapticManager.instance.impact(style: .heavy)
                                SoundManager.instance.playSound(sound: .button)
                                withAnimation{
                                    isOn = false
                                    gameTime = false
                                    mime = false
                                    wild = false
                                    sing = false
                                    lunch = false
                                    lights = false
                                    feeling = false
                                    legends = false
                                    spotlight = false
                                    once = false
                                    mimeS = false
                                    wildS = false
                                    singS = false
                                    lunchS = false
                                    lightsS = false
                                    feelingS = false
                                    legendsS = false
                                    spotlightS = false
                                    onceS = false
                                    
                                    totalWords = 0
                                    score = 0
                                }
                            }
                        Spacer()
                    }
                    .padding()

                }
            }
                
            
            VStack{
                HStack{
                    Spacer()
                    Text("\(scoreText): \(score)")
                        .font(.custom("LilitaOne", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color(.white))
                    Spacer()
                    Text("\(totalText): \(totalWords)")
                        .font(.custom("LilitaOne", size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(Color(.white))
                    Spacer()
                }
                .onAppear{
                    if english == true {
                        totalText = "Words Played"
                        scoreText = "Score"
                    }
                    else if spanish == true {
                        totalText = "Palabras"
                        scoreText = "Puntos"
                    }
                }
                .padding()
                Spacer()
                VStack{
                    Spacer()
                    Text("\(rightWords) ")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemGreen))
                        .lineSpacing(10)
                        .multilineTextAlignment(.center)
                    Text("\(wrongWords) ")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemRed))
                        .lineSpacing(10)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .onAppear{
                    if mime == true {
                        size = 40
                        if totalWords >= 12{
                            size = 25
                        }
                    }
                    else if wild == true {
                        size = 40
                        if totalWords >= 12{
                            size = 25
                        }
                    }
                    else if sing == true {
                        size = 30
                        if totalWords >= 10 {
                            size = 20
                        }
                    }
                    else if lunch == true {
                        size = 40
                        if totalWords >= 12{
                            size = 25
                        }
                    }
                    else if lights == true {
                        size = 35
                        if totalWords >= 10 {
                            size = 25
                        }
                    }
                    else if feeling == true {
                        size = 40
                        if totalWords >= 12{
                            size = 25
                        }
                    }
                    else if legends == true {
                        size = 40
                        if totalWords >= 12{
                            size = 25
                        }
                    }
                    else if spotlight == true {
                        size = 40
                        if totalWords >= 12{
                            size = 25
                        }
                    }
                    else if once == true {
                        size = 30
                        if totalWords >= 10 {
                            size = 20
                        }
                    }
                    else if mimeS == true {
                        size = 40
                        if totalWords >= 12{
                            size = 25
                        }
                    }
                    else if wildS == true {
                        size = 40
                        if totalWords >= 12{
                            size = 25
                        }
                    }
                    else if singS == true {
                        size = 30
                        if totalWords >= 10 {
                            size = 20
                        }
                    }
                    else if lunchS == true {
                        size = 40
                        if totalWords >= 12{
                            size = 25
                        }
                    }
                    else if lightsS == true {
                        size = 35
                        if totalWords >= 10 {
                            size = 25
                        }
                    }
                    else if feelingS == true {
                        size = 40
                        if totalWords >= 12{
                            size = 25
                        }
                    }
                    else if legendsS == true {
                        size = 40
                        if totalWords >= 12{
                            size = 25
                        }
                    }
                    else if spotlightS == true {
                        size = 40
                        if totalWords >= 12{
                            size = 25
                        }
                    }
                    else if onceS == true {
                        size = 30
                        if totalWords >= 10 {
                            size = 20
                        }
                    }
                }
            }
        }
        .onAppear{
            SoundManager.instance.playSound(sound: .buzzer)
        }
    }

}

struct PostGameView_Previews: PreviewProvider {
    static var previews: some View {
        PostGameView(isOn: .constant(true), gameTime: .constant(false), mime: .constant(false), wild: .constant(false), sing: .constant(false), lunch: .constant(false), lights: .constant(false), feeling: .constant(false), legends: .constant(false), spotlight: .constant(false), once: .constant(false), rightWords: .constant("Run"), wrongWords: .constant("Ran"), mimeS: .constant(false), wildS: .constant(false), singS: .constant(false), lunchS: .constant(false), lightsS: .constant(false), feelingS: .constant(false), legendsS: .constant(false), spotlightS: .constant(false), onceS: .constant(false), english: .constant(false), spanish: .constant(true), score: .constant(0), totalWords: .constant(0))
    }
}
