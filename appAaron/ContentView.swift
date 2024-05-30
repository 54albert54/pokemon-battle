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
   

    var body: some View {
        NavigationStack{
            ZStack(alignment:.bottom){
                Color.blue
                VStack{
                    battleContentView()
                        .padding(.bottom , 60)
                    
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
                            vc.showItems.toggle()
                        }
                        MainButton (color:.green ) {
                            Text("party")
                        }
                    }
                    .offset(y:-60)
                }
            }
            .ignoresSafeArea()
        }
        .sheet(isPresented: $vc.showItems, content: {
            ItemContainer(showItems:$vc.showItems )
            }
        )
    }

}






#Preview {
    ContentView()
        .environmentObject(PokeBattleController())
}

struct ItemContainer:View {
    @Binding var showItems:Bool
    @EnvironmentObject var vc:PokeBattleController
    
    var urlButton = URL(string: "https://imgs.search.brave.com/CIFIOyV-sca8cjlKcWwz839MJQ9-fFJnnFKwCNfizuY/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/cG5nYWxsLmNvbS93/cC1jb250ZW50L3Vw/bG9hZHMvNC9SZWQt/Q2xvc2UtQnV0dG9u/LVBORy1DbGlwYXJ0/LnBuZw")
    var body: some View {
        VStack(alignment:.center){
            HStack{
                Spacer()
                Button(action: {
                    showItems = false
                }, label: {
                    KFImage(urlButton)
                        .resizable()
                        .frame(width: 60 , height: 60)
                })
                .offset(x:-20 , y:20)
                   
          
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
           
            
            
            HStack{
                Text("potion \(vc.potitionCount)")
                    .padding()
                Spacer()
            }
                
            .padding()
                .frame(maxWidth: 320 )
                
                    .foregroundStyle(.black)
                    .onTapGesture {
                        vc.usePotion()
                    }
            
            
            Spacer()
        }
        .frame(width: 320 , height: 400)
        .background(.white)
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
