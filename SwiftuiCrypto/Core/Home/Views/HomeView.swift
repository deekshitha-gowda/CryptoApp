//
//  HomeView.swift
//  SwiftuiCrypto
//
//  Created by ATEU on 29/12/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortFolio : Bool = false
    
    var body: some View {
        ZStack{
            Color.theme.background
                .edgesIgnoringSafeArea(.all)
            
            //Content layer
            VStack{
                homeHeader
                
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

extension HomeView {
    private var homeHeader : some View {
        HStack{
            CircleButtonView(iconName: showPortFolio ? "plus" : "info")
                .animation(.none)
                .background(CircleButtonAnimationView(animate: $showPortFolio))
            Spacer()
            Text(showPortFolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortFolio ? 180 : 0))
                
                .onTapGesture {
                    withAnimation (.spring){
                        showPortFolio.toggle()
                    }
                }
            
        }
        .padding(.horizontal)

    }
}
