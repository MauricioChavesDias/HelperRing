//
//  LoadingView.swift
//  HelperRing
//
//  Created by Mauricio Dias on 19/10/2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .tint(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            .background(.blue)
    }
}
