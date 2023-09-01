//
//  CircleButtonAnumationView.swift
//  CryptoApp
//
//  Created by Boris R on 01/09/23.
//

import SwiftUI

struct CircleButtonAnumationView: View {
    @State private var animate: Bool = true
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 0.0 : 1.0)
            .opacity(animate ? 1.0 : 0.0)
            .animation(Animation.easeInOut(duration: 1.0), value: animate)
            .onAppear() {
                animate.toggle()
            }
    }
}

struct CircleButtonAnumationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnumationView()
    }
}
