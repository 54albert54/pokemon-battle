//
//  PokemonInfo.swift
//  appAaron
//
//  Created by Angel alberto Bernechea on 5/30/24.
//

import SwiftUI

struct PokemonInfo:View {
    var pokemon:Pokemon
    var currentColor:Color {
        currentColor(for: pokemon.hp, maxHP: pokemon.maxHp)
    }
    
    
    
    var body: some View {
        VStack{
            Text(pokemon.name)
                .font(.system(size: 20 ,weight: .bold))
               
            ZStack(alignment:.leading){
                
                VStack(alignment:.leading){
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).fill(currentColor)
                        .frame(width: CGFloat(pokemon.hp), height: 20)
                        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: pokemon.hp)
                }
                
                
                Text("\(pokemon.hp)/100")
                    .padding(.leading,20)
            }
            
        }
        .frame(width: 120)
        .padding()
        .background(Color(hex: "#48484850"))
        .clipShape(RoundedRectangle(cornerRadius: 15 , style: .circular))
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/).fill(.black)
        }
        
        
    }
    // Función para calcular el color según el % de HP
        func currentColor(for hp: Int, maxHP: Int) -> Color {
            let percentage = Double(hp) / Double(maxHP)
            
            switch percentage {
            case 0.75...:
                return .green
            case 0.5..<0.75:
                return .yellow
            case 0.25..<0.5:
                return .orange
            case ..<0.25:
                return .red
            default:
                return .gray
            }
        }
}

#Preview {
    PokemonInfo( pokemon: Pokemon.dummyPokemon)
}
