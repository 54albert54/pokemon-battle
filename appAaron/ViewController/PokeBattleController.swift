//
//  PokeBattleController.swift
//  appAaron
//
//  Created by Angel alberto Bernechea on 5/30/24.
//

import Foundation

class PokeBattleController :ObservableObject{
    @Published var playerPokemon:[Pokemon]
    @Published var enemyPokemon:[Pokemon]
    @Published var messages = [String]()
    @Published var showItems = false
    @Published var potionCount = 5
    @Published var ownPokemonIndex = 0
    @Published var enemyPokemonIndex = 0
    
    init() {
        self.playerPokemon = [Pokemon.dummyPokemon , Pokemon.dummyPokemonEnemy]
        self.enemyPokemon = [Pokemon.dummyPokemon , Pokemon.dummyPokemonEnemy]
    }
    func addLog(_ msj:String){
        messages.append(msj)
        
    }
    func playerAttack(){
        
        self.addLog("Player Attack!! ")
        playerPokemon[ownPokemonIndex].isAttacking = true
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { [self] _ in
            self.playerPokemon[ownPokemonIndex].isAttacking = false
            
            if self.enemyPokemon[enemyPokemonIndex].hp > 0 {
                self.enemyPokemon[enemyPokemonIndex].hp -= 10
                self.addLog("Enemy recived damage!! ")
                if enemyPokemon[enemyPokemonIndex].hp == 0{
                    addLog("enemy is defeat ")
                    if enemyPokemonIndex + 1 < enemyPokemon.count {
                        addLog("enemy is change ")
                        enemyPokemonIndex += 1
                    }
                }
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                    self.enemyAttack()
                    
                   }
            }
           }
        
    }
    func changeMyPokemon(_ newID:Int?){
        if let validID = newID {
            ownPokemonIndex = validID
            addLog("Player choose a \(self.playerPokemon[ownPokemonIndex].name) for ATTACK!!!")
        }
    }
    func enemyAttack(){
        if enemyPokemon[enemyPokemonIndex].hp > 0 {
        self.addLog("Enemy Attack!! ")
        enemyPokemon[enemyPokemonIndex].isAttacking = true
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { [self] _ in
            self.enemyPokemon[enemyPokemonIndex].isAttacking = false
            self.playerPokemon[ownPokemonIndex].hp -= 10
            self.addLog("Player lost live!! ")
            if self.playerPokemon[ownPokemonIndex].hp == 0 {
                self.playerPokemon[ownPokemonIndex].islive = false
            }
           }}
    }
    func usePotion(){
        self.showItems = false
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { [self] _ in
            self.addLog("Player used a potion ")
            if self.potionCount > 0{
                self.playerPokemon[ownPokemonIndex].hp += 20
                self.potionCount -= 1
            }
            
            self.enemyAttack()
        }
    }
}
