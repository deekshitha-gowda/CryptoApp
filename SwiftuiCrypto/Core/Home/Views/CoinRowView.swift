import SwiftUI

struct CoinRowView : View {
   let coin : CoinModel
    let showHoldingsColumn : Bool
    var body: some View {
        HStack (spacing :0){
            leftColumn
            Spacer()
            if showHoldingsColumn {  
                           centerColumn
                
                       }
            rightColumn
                
        }.font(.subheadline)
    }
}

struct coinRowView_Previews : PreviewProvider {
    static var previews : some View {
        CoinRowView(coin: dev.coin, showHoldingsColumn: false)
    }
}
extension CoinRowView {
    private var leftColumn : some View {
        HStack (spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            CoinImageView(coin: coin).frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }
    private var centerColumn : some View {
        VStack(alignment : .trailing){
            Text(coin.currentHoldingsValue.asCurrencyWith2DecimalPlaces())
            Text((coin.currentHoldings ?? 0).asNumberString())
                .bold()
        }.foregroundColor(Color.theme.accent)
    }
    private var rightColumn : some View {
        VStack(alignment: .trailing){
            Text("\(coin.currentPrice.asCurrencyWith6DecimalPlaces())")
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentage() ?? "")
                .foregroundColor((coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red )
        }.frame(width: UIScreen.main.bounds.width / 3.5)
    }
}
