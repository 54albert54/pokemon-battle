//
//  appAaronApp.swift
//  appAaron
//
//  Created by Angel alberto Bernechea on 4/25/24.
//

import SwiftUI

@main
struct appAaronApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(PokeBattleController())
        }
    }
}
