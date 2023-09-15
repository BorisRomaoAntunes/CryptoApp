//
//  HomeVIew.swift
//  CryptoApp
//
//  Created by Boris R on 01/09/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortifolio: Bool = false
    
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            VStack{
                homeHander
                
                columnTitle
                
                if !showPortifolio {
                    allCoinList
                        .transition(.move(edge: .leading))
                }
                
                if showPortifolio {
                    portifioCoinList
                        .transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0)
                
            }
        }
    }
}

struct HomeVIew_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}


extension HomeView{
    
    private var homeHander: some View {
            HStack{
                CiircleButtonView(iconName: showPortifolio ? "plus" : "info")
                    .animation(.none, value: showPortifolio)
                    .background(
                        CircleButtonAnumationView(animate: $showPortifolio)
                    )
                Spacer()
                Text(showPortifolio ? "Portifolio" : "Live Prices")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.theme.accent)
                Spacer()
                CiircleButtonView(iconName: "chevron.right")
                    .rotationEffect(Angle(degrees: showPortifolio ? 0 : 180))
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showPortifolio.toggle()
                        }
                    }
            }
            .padding()
    }
    
    private var allCoinList: some View{
        List{
            ForEach(vm.allCoins){ coin in
                CoinRowView(coin: coin, showHoldingColunm: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
        .transition(.move(edge: .leading))
    }
    
    private var portifioCoinList: some View{
        List{
            ForEach(vm.portfolioCoin){ coin in
                CoinRowView(coin: coin, showHoldingColunm: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    
    private var columnTitle: some View{
        HStack{
            Text("Coin")
            Spacer()
            if showPortifolio {
                Text("Holding")
            }
                
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryTextColor)
        .padding(.horizontal)

    }
}
