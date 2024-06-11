//
//  LogArea.swift
//  appAaron
//
//  Created by Angel alberto Bernechea on 5/30/24.
//



import SwiftUI



struct LogArea: View {
    @EnvironmentObject var vc: PokeBattleController
   
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Battle Start")
                .fontWeight(.semibold)
                .font(.title2)
                .padding(3)
            
            ScrollViewReader { proxy in
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(vc.messages.indices, id: \.self) { index in
                            Text(vc.messages[index])
                                .padding(.leading , 10)
                                .frame(width: 340, alignment: .leading)
                                .id(index)  // Asignar un ID único basado en el índice
                        }
                    }
                    .onChange(of: vc.messages) { _ in
                        withAnimation {
                            proxy.scrollTo(vc.messages.indices.last, anchor: .bottom)
                        }
                    }
                  
                }
            }
            
            Spacer()
            
           
        }
        .foregroundStyle(.black)
        .frame(width: 340, height: 200)
        .background(Color.white)
        .border(Color.black)
        .offset(y: 10.0)
    }
}

#Preview {
    LogArea()
        .environmentObject(PokeBattleController())
}
