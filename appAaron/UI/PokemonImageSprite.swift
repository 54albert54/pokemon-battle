//
//  PokemonImageSprite.swift
//  appAaron
//
//  Created by Angel alberto Bernechea on 5/30/24.
//

import SwiftUI
import Kingfisher

struct PokemonImageSprite:View {
    @EnvironmentObject var vc:PokeBattleController
    var url:URL
    var pokemonIsAttacking:Bool
    var isEnemy:Bool


    var body: some View {
        ZStack{
            
           
            RoundedRectangle(cornerRadius: 50.0 )
                .fill(Color.gray)
                .frame(width: 130 , height: 40)
                .offset(y:40)
                
            VStack{
                KFImage(url)
                    .resizable()
                    .frame(width: 240 , height: 240)
                    .offset(x: pokemonIsAttacking ? 25 : -25 )
                    .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: pokemonIsAttacking)
            }
            .offset(x:isEnemy ? 20 : 0)
            
        }
    }

}

#Preview {
    VStack{
        PokemonImageSprite(url: URL(string: Pokemon.dummyPokemonEnemy.sprites[0]["front"]! )! , pokemonIsAttacking: Pokemon.dummyPokemonEnemy.isAttacking , isEnemy: false )
            .environmentObject(PokeBattleController())
    }
    .background(.white)
}
