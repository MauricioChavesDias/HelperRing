//
//  CustomProgressBar.swift
//  HelperRing
//
//  Created by Mauricio Dias on 24/10/2022.
//

import SwiftUI

struct CustomProgressBar: View {
    @State private var progressAmount = 0.0
    var title: String
    var value: Double
    var total: Double
    var barColor: Color {
        return .red
    }
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            ProgressView(title, value: progressAmount, total: total)
                .tint(barColor)
                .onReceive(timer) { _ in
                    if progressAmount < value {
                        progressAmount += (value*0.1)
                    }
                }
                .font(.caption)
                .bold()
            
            Text(Int(progressAmount).description)
                .font(.caption2)
                .foregroundColor(barColor)
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

struct CustomProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        //CustomProgressBar(title: "HP: ",value: 2220, total: 3000)
        CustomProgressBar(title: "HP: ", value: 2220, total: 3000)
    }
}
