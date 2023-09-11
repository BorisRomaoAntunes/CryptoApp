//
//  CircleButtonAnumationView.swift
//  CryptoApp
//
//  Created by Boris R on 01/09/23.
//

import SwiftUI

struct CircleButtonAnumationView: View {
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ?  Animation.easeInOut(duration: 1.0) : .none, value: animate)
            .onAppear() {
                animate = false
            }
    }
}

struct CircleButtonAnumationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnumationView(animate: .constant(false))
            .foregroundColor(.red)
            .frame(width: 100, height: 100)
    }
}
