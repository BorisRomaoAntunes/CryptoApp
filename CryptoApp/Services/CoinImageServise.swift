//
//  CoinImageServise.swift
//  CryptoApp
//
//  Created by Boris R on 13/09/23.
//

import Foundation
import SwiftUI
import Combine

class CoinImageServise{
    @Published var image: UIImage? = nil
    
   private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let filmeMage = LocalFileManager.instance
    private let folderName = "coin_image"
    private let imageName: String
    
    init(coin: CoinModel){
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
        
    }
    private func getCoinImage() {
        if let savedImagem =  filmeMage.getImage(imageName: coin.id, folderName: folderName){
            image = savedImagem
            print(" 🙌 Retrieved image from File Manage!")
        } else {
            dowloadCoinImage()
            print("Download image now")        }
    }
    
    private func dowloadCoinImage(){
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = returnedImage
                self.imageSubscription?.cancel()
                self.filmeMage.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }

}
