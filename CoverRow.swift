//
//  CoverRow.swift
//  ActItOut
//
//  Created by Sebastian Molina on 7/23/23.
//

import SwiftUI
import StoreKit

struct CoverRow: View {
    
    
    @Binding var isOn: Bool
    
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
    
    
    @State var cover: Cover
    
    var body: some View {

            VStack{
                HStack{
                    Spacer()
                    Image(cover.imageName)
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .medium)
                            SoundManager.instance.playSound(sound: .button)
                            if cover.imageName == "Mime" {
                                mime = true
                            }
                            else if cover.imageName == "Wild" {
                                wild = true
                            }
                            else if cover.imageName == "Sing" {
                                sing = true
                            }
                            else if cover.imageName == "Lunch" {
                                lunch = true
                            }
                            else if cover.imageName == "Lights" {
                                lights = true
                            }
                            else if cover.imageName == "Feeling" {
                                feeling = true
                            }
                            else if cover.imageName == "Legends" {
                                
                                legends = true
                            }
                            else if cover.imageName == "Spotlight" {
                                spotlight = true
                            }
                            else if cover.imageName == "Once" {
                                once = true
                            }
                            else if cover.imageName == "Mania" {
                                mimeS = true
                            }
                            else if cover.imageName == "Manada" {
                                wildS = true
                            }
                            else if cover.imageName == "Cantalo" {
                                singS = true
                            }
                            else if cover.imageName == "Comer" {
                                lunchS = true
                            }
                            else if cover.imageName == "Luces" {
                                lightsS = true
                            }
                            else if cover.imageName == "Locura" {
                                feelingS = true
                            }
                            else if cover.imageName == "Leyendas" {
                                legendsS = true
                            }
                            else if cover.imageName == "Bajo" {
                                spotlightS = true
                            }
                            else if cover.imageName == "Erase" {
                                onceS = true
                            }
                            withAnimation{
                                isOn = true
                            }
                        }
                                    
                    Spacer()
                    Spacer()
                    Image(cover.imageName2)
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .medium)
                            SoundManager.instance.playSound(sound: .button)
                            if cover.imageName2 == "Mime" {
                                mime = true
                            }
                            else if cover.imageName2 == "Wild" {
                                wild = true
                            }
                            else if cover.imageName2 == "Sing" {
                                sing = true
                            }
                            else if cover.imageName2 == "Lunch" {
                                lunch = true
                            }
                            else if cover.imageName2 == "Lights" {
                                lights = true
                            }
                            else if cover.imageName2 == "Feeling" {
                                feeling = true
                            }
                            else if cover.imageName2 == "Legends" {
                                legends = true
                            }
                            else if cover.imageName2 == "Spotlight" {
                                spotlight = true
                            }
                            else if cover.imageName2 == "Once" {
                                once = true
                            }
                            else if cover.imageName2 == "Mania" {
                                mimeS = true
                            }
                            else if cover.imageName2 == "Manada" {
                                wildS = true
                            }
                            else if cover.imageName2 == "Cantalo" {
                                singS = true
                            }
                            else if cover.imageName2 == "Comer" {
                                lunchS = true
                            }
                            else if cover.imageName2 == "Luces" {
                                lightsS = true
                            }
                            else if cover.imageName2 == "Locura" {
                                feelingS = true
                            }
                            else if cover.imageName2 == "Leyendas" {
                                legendsS = true
                            }
                            else if cover.imageName2 == "Bajo" {
                                spotlightS = true
                            }
                            else if cover.imageName2 == "Erase" {
                                onceS = true
                            }
                            withAnimation{
                                isOn = true
                            }
                        }
                    Spacer()
                    Image(cover.imageName3)
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom)
                        .onTapGesture {
                            HapticManager.instance.impact(style: .medium)
                            SoundManager.instance.playSound(sound: .button)
                            if cover.imageName3 == "Mime" {
                                mime = true
                            }
                            else if cover.imageName3 == "Wild" {
                                wild = true
                            }
                            else if cover.imageName3 == "Sing" {
                                sing = true
                            }
                            else if cover.imageName3 == "Lunch" {
                                lunch = true
                            }
                            else if cover.imageName3 == "Lights" {
                                lights = true
                            }
                            else if cover.imageName3 == "Feeling" {
                                feeling = true
                            }
                            else if cover.imageName3 == "Legends" {
                                legends = true
                            }
                            else if cover.imageName3 == "Spotlight" {
                                spotlight = true
                            }
                            else if cover.imageName3 == "Once" {
                                once = true
                            }
                            else if cover.imageName3 == "Mania" {
                                mimeS = true
                            }
                            else if cover.imageName3 == "Manada" {
                                wildS = true
                            }
                            else if cover.imageName3 == "Cantalo" {
                                singS = true
                            }
                            else if cover.imageName3 == "Comer" {
                                lunchS = true
                            }
                            else if cover.imageName3 == "Luces" {
                                lightsS = true
                            }
                            else if cover.imageName3 == "Locura" {
                                feelingS = true
                            }
                            else if cover.imageName3 == "Leyendas" {
                                legendsS = true
                            }
                            else if cover.imageName3 == "Bajo" {
                                spotlightS = true
                            }
                            else if cover.imageName3 == "Erase" {
                                onceS = true
                            }
                            withAnimation{
                                isOn = true
                            }
                        }
                    Spacer()
                }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color(.clear))
        
    }
    
    
    
    }

struct CoverRow_Previews: PreviewProvider {
    static var previews: some View {
        CoverRow(isOn: .constant(true), mime: .constant(false), wild: .constant(false), sing: .constant(false), lunch: .constant(false), lights: .constant(false), feeling: .constant(false), legends: .constant(false), spotlight: .constant(false), once: .constant(false), mimeS: .constant(false), wildS: .constant(false), singS: .constant(false), lunchS: .constant(false), lightsS: .constant(false), feelingS: .constant(false), legendsS: .constant(false), spotlightS: .constant(false), onceS: .constant(false), cover: Cover(imageName: "Mime", imageName2: "Wild", imageName3: "Spotlight"))
    }
}
