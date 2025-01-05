//
//  Color.swift
//  SwiftuiCrypto
//
//  Created by ATEU on 29/12/24.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = colorTheme()
}

struct colorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}
