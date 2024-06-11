//
//  ContentView.swift
//  appAaron
//
//  Created by Angel alberto Bernechea on 4/25/24.
//



import SwiftUI
import Kingfisher

struct ContentView: View {
    @EnvironmentObject var vc:PokeBattleController
    @State var showItems = false
    @State var showParty = false
    
   

    var body: some View {
        NavigationStack{
            ZStack(alignment:.bottom){
                Color.init(hex: "#444")
                VStack{
                    battleContentView()
                        .padding(.bottom , 60)
                        .onChange(of: vc.playerPokemon[vc.ownPokemonIndex].hp) {
                            let nameCurrentPokemon = vc.playerPokemon[vc.ownPokemonIndex].name
                            if vc.playerPokemon[vc.ownPokemonIndex].hp <= 0{
                                
                                vc.addLog("\(nameCurrentPokemon) is defeated ")
                                Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { _ in
                                    showParty = true
                                }
                                
                                
                                
                            }
                        }
                    
                    HStack{
                        MainButton(color:.red ){
                            Text("atacar")
                        }
                        .onTapGesture {
                            vc.playerAttack()
                        }
                        MainButton(color:.yellow ) {
                            Text("items")
                        }
                        .onTapGesture {
                            showItems.toggle()
                        }
                        MainButton (color:.green ) {
                            Text("party")
                        }
                        .onTapGesture {
                            showParty.toggle()
                        }
                    }
                    .offset(y:-60)
                }
            }
            .ignoresSafeArea()
        }
        .sheet(isPresented: $showItems, content: {
            ItemContainer(showItems:$showItems, dataToShow: 
                            VStack{
                ListItemsView(tile: "Potions", Quantity: vc.potionCount)
                    .onTapGesture {
                        vc.usePotion()
                        showItems.toggle()
                    }
               
               
            }, titleMenu: "Items")
            }
        )
        .sheet(isPresented: $showParty, content: {
            ItemContainer(showItems:$showParty, dataToShow:
                            VStack{
                
                ForEach(Array(vc.playerPokemon.enumerated()), id:\.element.id){ ind, pokemonteam in
                    if pokemonteam.islive {
                        ListItemsView(tile: " \(pokemonteam.name)", Quantity: pokemonteam.hp)
                            .onTapGesture {
                                vc.changeMyPokemon( ind)
                                showParty.toggle()
                            }
                    }else {
                        Text("you lose this pokemon")
                    }
                }

            }, titleMenu: "Party" )
            
            
            
        })
    }

}






#Preview {
    ContentView()
        .environmentObject(PokeBattleController())
    
}

struct ItemContainer<data:View>:View {
    @Binding var showItems:Bool
    let dataToShow:data
    @EnvironmentObject var vc:PokeBattleController
    let titleMenu:String
    
    
  
    var body: some View {
        VStack(alignment:.center){
            HStack{
                Spacer()
                Button(action: {
                    showItems = false
                }, label: {
                   
                        Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                             .foregroundStyle(Color.red)
                             .frame(width: 30 , height: 30)
                })
                .offset(x:-20 , y:20)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            VStack{
                Text(titleMenu)
                    .font(.title)
                    .fontWeight(.bold)
                    .offset(y:-30)
             //LIST - ITEMSS
                dataToShow
                
            }
                
            .padding()
                .frame(maxWidth: 320 )
                
                    .foregroundStyle(.black)
                    .onTapGesture {
                       
                        showItems = false
                    }
            
            
            Spacer()
        }
        .frame(width: 320 , height: 400)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
//        .overlay {
//            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
//        }
    }
}



struct ListItemsView:View {
    var tile:String
    var Quantity:Int
    var body: some View {
        HStack{
            Text(tile)
                .font(.title3)
                .fontWeight(.semibold)
            Text("\(Quantity)")
                
                .padding(.trailing , 30)
            Spacer()
    }
        Divider()
    }
}








func MainButton<Content :View>(color:Color,content:() -> Content) -> some View {
    @State var direction = false
    
    return ZStack{
        
        VStack{
            
            Text("")
            content()
                .font(.title)
                .foregroundStyle(.black)
        }
        
        .padding()
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .offset(x:  7 ,y:7)
        
        VStack{
            Text("")
            content()
                .font(.title)
                .foregroundStyle(.black)
                .offset(y:-10)
        }
        .padding()
        .background(color)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 2)
                .fill(.black)
                .shadow(color: .black, radius: 10 , x: 12)
            
        }
    }.padding(.horizontal,3)
    
}
