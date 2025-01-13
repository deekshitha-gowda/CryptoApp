//
//  UIApplication.swift
//  SwiftuiCrypto
//
//  Created by ATEU on 12/01/25.
//

import Foundation
import SwiftUI
extension UIApplication {
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
