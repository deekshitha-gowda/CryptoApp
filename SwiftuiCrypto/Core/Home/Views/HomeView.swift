//
//  HomeView.swift
//  SwiftuiCrypto
//
//  Created by ATEU on 29/12/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color.theme.background
                .edgesIgnoringSafeArea(.all)
            
            //Content layer
            VStack{
                Text("Hello")
                Spacer()
            }
        }
    }
}

#Preview {
    NavigationView{
        HomeView()
    }
}

