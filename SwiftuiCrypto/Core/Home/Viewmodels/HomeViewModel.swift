import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoinss : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    private var dataService = CoinDataService()
    @Published var searchText : String = ""
    @Published var  statstics: [StatisticModel] = [
        StatisticModel(title: "Title ", value: "Value", percentageChange: 1),
        StatisticModel(title: "Title ", value: "Value" ),
        StatisticModel(title: "Title ", value: "Value", percentageChange: -23),
        StatisticModel(title: "Title ", value: "Value", percentageChange: -23)
        
    ]
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
        
    }
    
    func addSubscribers(){
       // updates allcoins
        
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.1), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoinss = returnedCoins
            }.store(in: &cancellables)
        
    }
    
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel]{
        guard !text.isEmpty else { return coins }
        let lowerCaseText = text.lowercased()
        
    return  coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowerCaseText) || coin.symbol.lowercased().contains(lowerCaseText) || coin.id.lowercased().contains(lowerCaseText)
        }
       
    }
}
