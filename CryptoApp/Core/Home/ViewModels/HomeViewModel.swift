//
//  HomeVIewModel.swift
//  CryptoApp
//
//  Created by Boris R on 12/09/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoin: [CoinModel] = []
    
    private let dataService = CoindataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    
        func addSubscribers() {
            dataService.$allCoins
                .sink { [weak self] (returnedCoins) in
                    self?.allCoins = returnedCoins
                }
            .store(in: &cancellables)
    }
}
