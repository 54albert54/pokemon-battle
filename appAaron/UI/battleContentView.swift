//
//  MainButton.swift
//  appAaron
//
//  Created by Angel alberto Bernechea on 5/29/24.
//

import SwiftUI

struct battleContentView:View {
    @EnvironmentObject var vc:PokeBattleController
    var body: some View {
        VStack(alignment:.center){
            VStack{
                
    //            Enemy Area View
                PokemonArea(showPokemon: vc.enemyPokemon[vc.enemyPokemonIndex])
                    .offset(y:30)
    //            player Area View
               
                VStack{
                    PokemonArea(showPokemon: vc.playerPokemon[vc.ownPokemonIndex] , isPlayer: true)
                        .offset(y:-30)
                   
                        
                }
                
                
            }
            .offset(y:50)
            LogArea()
//                .padding(.bottom , 20)
                .offset(y:-30)
        }
        
        .frame(width: 400, height: 730)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .overlay(content: {
            RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 2).fill(.black)
        })
        .offset(y:-130)
//        .padding()
    }
}

#Preview {
    battleContentView()
        .environmentObject(PokeBattleController())
}
