//
//  SwiftuiCryptoApp.swift
//  SwiftuiCrypto
//
//  Created by ATEU on 29/12/24.
//

import SwiftUI

@main
struct SwiftuiCryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
