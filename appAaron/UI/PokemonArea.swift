//
//  PokemonArea.swift
//  appAaron
//
//  Created by Angel alberto Bernechea on 5/30/24.
//

import SwiftUI

struct PokemonArea:View {
   
    @EnvironmentObject var vc:PokeBattleController
    var showPokemon:Pokemon
    var isPlayer: Bool = false
    var indexSprite: Int {
        isPlayer ? 1 : 0
    }
    var sideSprite: String {
        isPlayer ? "back" : "front"
    }

 
    var frontSpriteUrl:URL { URL(string: showPokemon.sprites[indexSprite][sideSprite]! )!}
    var body: some View {
        HStack(alignment:.center){
            if !isPlayer{
                PokemonInfo(pokemon: showPokemon)
                    .offset(x:50)
                PokemonImageSprite(url:frontSpriteUrl , pokemonIsAttacking: showPokemon.isAttacking ,isEnemy: true)
                    
            }else{
                PokemonImageSprite(url:frontSpriteUrl , pokemonIsAttacking: showPokemon.isAttacking ,isEnemy: false )
                    
                VStack{
                    PokemonInfo(pokemon: showPokemon)
                        .offset(x:-50)
                    HStack{
                        ForEach(vc.playerPokemon){ pokemon in
                            if pokemon.islive {
                                Image(systemName: "circle.fill")
                                    .foregroundStyle(.green)
                            }else{
                                Image(systemName: "circle.fill")
                                    .foregroundStyle(.black)
                            }
                            
                        }
                    }
                    .offset(y:10)
                }
            }
        }
        .background(.white)
    }
}

#Preview {
    PokemonArea(showPokemon: Pokemon.dummyPokemon ,isPlayer: true)
        .environmentObject(PokeBattleController())

}
