//
//  SwiftUIAppApp.swift
//  SwiftUIApp
//
//  Created by Michał Dunajski on 01/09/2021.
//

import SwiftUI

@main
struct SwiftUIAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(guess: RGB())
        }
    }
}
