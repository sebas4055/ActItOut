//
//  ContentView.swift
//  ActItOut
//
//  Created by Sebastian Molina on 7/21/23.
//

import SwiftUI
import AVKit

class SoundManager {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case button
        case buzzer
        case count
        case down
        case ding
        case wrong
    }
    
    func playSound(sound: SoundOption) {
    
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
        
        
    }
    
}

class HapticManager {
    
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}


struct CoverView: View {
    
    
    @State private var isOn = false
    
    @State private var gameTime = false
    
    @State var mime = false
    @State var wild = false
    @State var sing = false
    @State var lunch = false
    @State var lights = false
    @State var feeling = false
    @State var legends = false
    @State var spotlight = false
    @State var once = false
    
    @State var mimeS = false
    @State var wildS = false
    @State var singS = false
    @State var lunchS = false
    @State var lightsS = false
    @State var feelingS = false
    @State var legendsS = false
    @State var spotlightS = false
    @State var onceS = false
    
    @State var english = true
    @State var spanish = false

    @State var timeRemaining = 60
    
    @State var covers: [Cover] = [Cover]()
    @State var dataServiceE = DataServiceE()
    @State var dataServiceS = DataServicS()
    
    @State var categories = "Categories!"
    
    var body: some View {
        
        if isOn {
            DescriptionView(isOn: $isOn, gameTime: $gameTime, mime: $mime, wild: $wild, sing: $sing, lunch: $lunch, lights: $lights, feeling: $feeling, legends: $legends, spotlight: $spotlight, once: $once, mimeS: $mimeS, wildS: $wildS, singS: $singS, lunchS: $lunchS, lightsS: $lightsS, feelingS: $feelingS, legendsS: $legendsS, spotlightS: $spotlightS, onceS: $onceS, english: $english, spanish: $spanish)
            
        } else{
        
            ZStack{
                
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                
                VStack{
                    
                    Text(categories)
                        .font(.custom("LilitaOne", size: 60))
                        .fontWeight(.bold)
                        .foregroundColor(Color(.white))
                        .multilineTextAlignment(.leading)
                        .padding(.top, 30)
                    
                    List(covers){ cover in
                        
                        CoverRow(isOn: $isOn, mime: $mime, wild: $wild, sing: $sing, lunch: $lunch, lights: $lights, feeling: $feeling, legends: $legends, spotlight: $spotlight, once: $once, mimeS: $mimeS, wildS: $wildS, singS: $singS, lunchS: $lunchS, lightsS: $lightsS, feelingS: $feelingS, legendsS: $legendsS, spotlightS: $spotlightS, onceS: $onceS, cover: cover)
                        
                    }
                    .listStyle(.plain)
                    .listRowSeparator(.hidden)
                    .onAppear{
                        if english == true {
                            covers = dataServiceE.getDataE()
                            categories = "Categories!"
                        }
                        else if spanish == true {
                            covers = dataServiceS.getDataS()
                            categories = "¡Categorias!"
                        }
                    }
                    HStack{
                            Spacer()
                            Image("flagCircle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60)
                                .onTapGesture {
                                    SoundManager.instance.playSound(sound: .button)
                                    HapticManager.instance.impact(style: .heavy)
                                    withAnimation{
                                        english = true
                                        spanish = false
                                        covers = dataServiceE.getDataE()
                                        categories = "Categories!"
                                    }
                                }
                        Spacer()
             
                            Image("mexicanCircle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60)
                                .onTapGesture {
                                    SoundManager.instance.playSound(sound: .button)
                                    HapticManager.instance.impact(style: .heavy)
                                    withAnimation{
                                        spanish = true
                                        english = false
                                        covers = dataServiceS.getDataS()
                                        categories = "¡Categorias!"
                                    }
                                }
                            Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
}

    struct CoverView_Previews: PreviewProvider {
        static var previews: some View {
            CoverView()
        }
    }

