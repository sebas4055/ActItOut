//
//  ContentView.swift
//  ActItOut
//
//  Created by Sebastian Molina on 7/21/23.
//

import SwiftUI

struct ContentView2: View {
    
    @State var covers:[Cover] = [Cover]()
    var dataService = DataService()
    
    var body: some View {
        
        ZStack {
            Image("gradient")
                .resizable()
                .ignoresSafeArea()
            
            List(covers) { cover in
                
                VStack{
                    Spacer()
                    HStack{
                        Button{
                            doit()
                        } label: {
                            Image(cover.imageName)
                                .resizable()
                                .frame(width: 100 , height: 100)
                        }
                        
                        Text(cover.description)
                            .font(.subheadline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("gold"))
                            .bold()
                        Spacer()
                    }
                    
                }
                .listRowSeparatorTint(Color("gold"))
                .listRowBackground(Color(.clear))
            }
            .listStyle(.plain)
            .onAppear{
                covers = dataService.getData()
            }
        }
    }
}
    
    func doit() {
        print(Text("get"))
            }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

