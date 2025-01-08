import SwiftUI

struct HomeView: View {
    
    @State private var showPortFolio : Bool = false
    @EnvironmentObject private var vm : HomeViewModel
    
    var body: some View {
        ZStack{
            Color.theme.background
                .edgesIgnoringSafeArea(.all)
            
            //Content layer
            VStack{
                homeHeader
                if !showPortFolio {
                    allCoinsList
                        
                }
                if showPortFolio {
                    portfolioCoinsList
                        
                }
                
                
                
                
                Spacer(minLength: 0)
                
            }
        }
    }
}

struct HomeView_Previews : PreviewProvider {
    static var previews : some View {
        HomeView()
            .environmentObject(dev.HomeVm)
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
    private var allCoinsList : some View {
        List {
            ForEach(vm.allCoinss){
                coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }.listStyle(PlainListStyle())
            .transition(.move(edge: .leading))
    }
    private var portfolioCoinsList : some View {
        List {
            ForEach(vm.portfolioCoins){
                coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }.listStyle(PlainListStyle())
            .transition(.move(edge: .trailing))
        
    }
}
