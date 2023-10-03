//
//  CoinImageViewModel.swift
//  CryptoApp
//
//  Created by Boris R on 13/09/23.
//

import Foundation
import SwiftUI
import Combine

class CoinImagemViewModel: ObservableObject{
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coin: CoinModel
    private let dataServer : CoinImageServise
    private var cancellable = Set<AnyCancellable>()
    
    init(coin : CoinModel){
        self.coin = coin
        self.dataServer = CoinImageServise(coin: coin)
        self.addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers(){
        dataServer.$image
            .sink {[weak self] (_) in
                self?.isLoading = false
            } receiveValue: {[weak self]  (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellable)

    }
}
