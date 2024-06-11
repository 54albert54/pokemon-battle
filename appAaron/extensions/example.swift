//
//  example.swift
//  appAaron
//
//  Created by Angel alberto Bernechea on 6/10/24.
//

import SwiftUI

struct ContentView2<Header: View, Footer: View>: View {
    let headerView: Header
    let footerView: Footer

    var body: some View {
        VStack {
            headerView
            Spacer()
            footerView
        }
        .padding()
    }
}

struct ExampleView: View {
    var body: some View {
        ContentView2(
            headerView: VStack{
                Text("Header").font(.largeTitle)
                Text("eli fea")
            },
            footerView: Button("Footer Button", action: {})
        )
    }
}



#Preview {
    ExampleView()
}
