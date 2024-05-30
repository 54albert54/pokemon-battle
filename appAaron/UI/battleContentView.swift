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
                PokemonArea(showPokemon: vc.enemyPokemon)
                    .offset(y:30)
    //            player Area View
                
                PokemonArea(showPokemon: vc.playerPokemon , isPlayer: true)
                    .offset(y:-30)
                
                
            }
            .offset(y:50)
            LogArea()
                .padding(.bottom , 80)
                .offset(y:-30)
        }
        
        .frame(width: 340, height: 560)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .overlay(content: {
            RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 2).fill(.black)
        })
        .padding()
    }
}

#Preview {
    battleContentView()
        .environmentObject(PokeBattleController())
}
