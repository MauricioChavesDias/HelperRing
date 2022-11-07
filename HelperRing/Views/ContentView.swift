//
//  ContentView.swift
//  HelperRing
//
//  Created by Mauricio Dias on 18/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
