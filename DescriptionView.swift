//
//  DescriptionRow.swift
//  ActItOut
//
//  Created by Sebastian Molina on 7/30/23.
//

import SwiftUI

struct DescriptionView: View {
    
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
        
    
    @State var playText = "Play!"
    
    @State private var opacity = 0.1
    
    
    
    var body: some View {
        
        if gameTime == true {
            GameView(isOn: $isOn, gameTime: $gameTime, mime: $mime, wild: $wild, sing: $sing, lunch: $lunch, lights: $lights, feeling: $feeling, legends: $legends, spotlight: $spotlight, once: $once, mimeS: $mimeS, wildS: $wildS, singS: $singS, lunchS: $lunchS, lightsS: $lightsS, feelingS: $feelingS, legendsS: $legendsS, spotlightS: $spotlightS, onceS: $onceS, english: $english, spanish: $spanish)
        }
        else {
            ZStack{
                
                if mime == true {
                    Image("MimeInfo")
                        .resizable()
                        .ignoresSafeArea()
                }
                else if wild == true {
                    Image("WildInfo")
                        .resizable()
                        .ignoresSafeArea()
                }
                else if sing == true {
                    Image("SingInfo")
                        .resizable()
                        .ignoresSafeArea()
                }
                else if lunch == true {
                    Image("LunchInfo")
                        .resizable()
                        .ignoresSafeArea()
                }
                else if lights == true {
                    Image("LightsInfo")
                        .resizable()
                        .ignoresSafeArea()
                }
                else if feeling == true {
                    Image("FeelingInfo")
                        .resizable()
                        .ignoresSafeArea()
                }
                else if legends == true {
                    Image("LegendsInfo")
                        .resizable()
                        .ignoresSafeArea()
                }
                else if spotlight == true {
                    Image("SpotlightInfo")
                        .resizable()
                        .ignoresSafeArea()
                }
                else if once == true {
                    Image("OnceInfo")
                        .resizable()
                        .ignoresSafeArea()
                }
                else if mimeS == true {
                    Image("ManiaInfo")
                        .resizable()
                        .ignoresSafeArea()
                }
                else if wildS == true {
                    Image("ManadaInfo")
                        .resizable()
                        .ignoresSafeArea()
                }
                else if singS == true {
                    Image("CantaloInfo")
                        .resizable()
                        .ignoresSafeArea()
                }
                else if lunchS == true {
                    Image("ComerInfo")
                        .resizable()
                        .ignoresSafeArea()
                }
                else if lightsS == true {
                    Image("LucesInfo")
                        .resizable()
                        .ignoresSafeArea()
                }
                else if feelingS == true {
                    Image("LocuraInfo")
                        .resizable()
                        .ignoresSafeArea()
                }
                else if legendsS == true {
                    Image("LeyendasInfo")
                        .resizable()
                        .ignoresSafeArea()
                }
                else if spotlightS == true {
                    Image("BajoInfo")
                        .resizable()
                        .ignoresSafeArea()
                }
                else if onceS == true {
                    Image("EraseInfo")
                        .resizable()
                        .ignoresSafeArea()
                }
                
                VStack{
                    Spacer()
                    HStack{
                        Image(systemName: "arrowshape.backward.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: 45))
                            .onTapGesture {
                                SoundManager.instance.playSound(sound: .button)
                                HapticManager.instance.impact(style: .medium)
                                withAnimation{
                                    isOn = false
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
                                }
                            }
                            .padding()
                        
                        Spacer()
                        
                            if english == true {
                                Text("Play!")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.white))
                                    .frame(width: 125, height: 50)
                                    .background(Color(.systemBlue))
                                    .cornerRadius(5)
                                    .onTapGesture {
                                        SoundManager.instance.playSound(sound: .button)
                                        HapticManager.instance.impact(style: .heavy)
                                        withAnimation{
                                            gameTime = true
                                        }
                                    }
                                    .padding()
                            }
                            else if spanish == true {
                                Text("¡Comenzar!")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.white))
                                    .frame(width: 125, height: 50)
                                    .background(Color(.systemBlue))
                                    .cornerRadius(5)
                                    .onTapGesture {
                                        HapticManager.instance.impact(style: .heavy)
                                        SoundManager.instance.playSound(sound: .button)
                                        withAnimation{
                                            gameTime = true
                                        }
                                    }
                                    .padding()
                            }
                        
                    }
                    
                }
                
            }
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 0.75)) {
                    self.opacity = 1.0
                }
                
            }
        }
    }
}
struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(isOn: .constant(false), gameTime: .constant(false), mime: .constant(false), wild: .constant(false), sing: .constant(false), lunch: .constant(false), lights: .constant(false), feeling: .constant(false), legends: .constant(false), spotlight: .constant(false), once: .constant(false),mimeS: .constant(false), wildS: .constant(false), singS: .constant(false), lunchS: .constant(false), lightsS: .constant(false), feelingS: .constant(false), legendsS: .constant(false), spotlightS: .constant(false), onceS: .constant(false), english: .constant(false), spanish: .constant(false))
    }
}
