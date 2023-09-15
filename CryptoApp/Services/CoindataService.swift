//
//  CoindataServce.swift
//  CryptoApp
//
//  Created by Boris R on 12/09/23.
//

import Foundation
import Combine

class CoindataService{
    @Published var allCoins: [CoinModel] = []
    
    var coinSubcription: AnyCancellable?
    
    
    init() {
        getCoin()
    }
    // verificando se a url é valida
    private func getCoin (){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        coinSubcription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnCoins) in
                self?.allCoins = returnCoins
                self?.coinSubcription?.cancel()
            }        )
    }
}
