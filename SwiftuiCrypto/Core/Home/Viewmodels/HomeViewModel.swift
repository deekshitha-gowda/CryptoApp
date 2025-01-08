import Foundation

class HomeViewModel: ObservableObject {
    @Published var allCoinss : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoinss.append(Developerpreview.instance.coin)
            self.portfolioCoins.append(Developerpreview.instance.coin)
            
        }
    }
}
