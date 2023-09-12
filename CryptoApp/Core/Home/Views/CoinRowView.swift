//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Boris R on 11/09/23.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    
    let showHoldingColunm: Bool
    
    var body: some View {
        HStack(spacing: 0){
            leftColumn
            Spacer()
            if showHoldingColunm{
                CentralColumn
            }
            righColumn
        }
        .font(.subheadline)
    }
}


struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin, showHoldingColunm: true)
            .previewLayout(.sizeThatFits)
    }
}

extension CoinRowView {
    private var leftColumn: some View{
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryTextColor)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading,6)
                .foregroundColor(Color.theme.accent)
        }
        .frame(height: 0.0)
    }
    private var CentralColumn: some View{
        VStack(alignment: .trailing){
                Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                Text((coin.currentHoldings ?? 0).asNumberString())
                        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var righColumn: some View{
        VStack(alignment: .trailing){
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
            Text(coin.priceChangePercentage24H?.asPercentagenString() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.theme.greenColor : Color.theme.recColor)
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)

    }
}
