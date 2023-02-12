//
//  ContentView.swift
//  Xcode Demo
//
//  Created by Kenny Chu on 12/2/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "back"
    @State var cpuCard = "back"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack {
            Image("background-plain").resizable().ignoresSafeArea()
            
            VStack{
                Image("logo").padding(40)
                                
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Spacer()
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }

                
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        Text("Player").padding(.bottom, 20)
                        Text(String(playerScore))
                    }
                    Spacer()
                    VStack{
                        Text("CPU").padding(.bottom, 20)
                        Text(String(cpuScore))
                    }
                    Spacer()
                }.foregroundColor(.white)

            }.padding()
                .font(.largeTitle)
        }
        
        
    }
    
    func deal() {
        let player = getRandom()
        let cpu = getRandom()
        playerCard = "card\(player)"
        cpuCard = "card\(cpu)"

        if (player > cpu) {
            playerScore += 1
        } else if (cpu > player) {
            cpuScore += 1
        }
    }
    
    func getRandom() -> Int {
        let randomCard = Int.random(in: 2...14)
        return randomCard
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
