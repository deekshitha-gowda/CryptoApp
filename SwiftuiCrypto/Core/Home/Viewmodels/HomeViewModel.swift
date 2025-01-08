import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoinss : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    private var dataService = CoinDataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
        
    }
    
    func addSubscribers(){
        dataService.$allCoins
            .sink {  [weak self] (returnedCoins)  in
                self?.allCoinss = returnedCoins
            }
            .store(in: &cancellables)
    }
}
