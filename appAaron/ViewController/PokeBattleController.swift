//
//  PokeBattleController.swift
//  appAaron
//
//  Created by Angel alberto Bernechea on 5/30/24.
//

import Foundation

class PokeBattleController :ObservableObject{
    @Published var playerPokemon:Pokemon
    @Published var enemyPokemon:Pokemon
    @Published var messages = [String]()
    @Published var showItems = false
    @Published var potitionCount = 5
    
    init() {
        self.playerPokemon = Pokemon.dummyPokemon
        self.enemyPokemon = Pokemon.dummyPokemonEnemy
    }
    func addLog(_ msj:String){
        messages.append(msj)
        
    }
    func playerAttack(){
        
        self.addLog("Player Attack!! ")
        playerPokemon.isAttacking = true
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
            self.playerPokemon.isAttacking = false
            if self.enemyPokemon.hp > 0 {
                self.enemyPokemon.hp -= 10
                self.addLog("Enemy recived damage!! ")
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                    self.enemyAttack()
                    
                   }
                }
           }
        
    }
    func enemyAttack(){
        if enemyPokemon.hp > 0 {
        self.addLog("Enemy Attack!! ")
        enemyPokemon.isAttacking = true
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
            self.enemyPokemon.isAttacking = false
            self.playerPokemon.hp -= 10
            self.addLog("Player lost live!! ")
           }}
    }
    func usePotion(){
        self.showItems = false
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
            self.addLog("Player used a potion ")
            if self.potitionCount > 0{
                self.playerPokemon.hp += 20
                self.potitionCount -= 1
            }
            
            self.enemyAttack()
        }
    }
}
