//
//  CoinImageView.swift
//  CryptoApp
//
//  Created by Boris R on 13/09/23.
//

import SwiftUI

struct CoinImageView: View {
    @StateObject var vm: CoinImagemViewModel
    
    init(coin: CoinModel){
        _vm = StateObject(wrappedValue: CoinImagemViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack{
            if let image = vm.image{
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryTextColor)
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(coin: dev.coin)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
