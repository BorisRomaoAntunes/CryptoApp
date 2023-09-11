//
//  HomeVIew.swift
//  CryptoApp
//
//  Created by Boris R on 01/09/23.
//

import SwiftUI

struct HomeView: View {
    @State private var showPortifolio: Bool = false
    
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            VStack{
                homeHander
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
}
