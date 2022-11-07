//
//  DetailRow.swift
//  HelperRing
//
//  Created by Mauricio Dias on 19/10/2022.
//

import SwiftUI
import CachedAsyncImage

struct ItemRow: View {
    var name: String?
    var imageURL: String?
    var description: String?
    
    var body: some View {
        HStack(spacing: 10) {
            Group {
                if let url = imageURL {
                    CachedAsyncImage(url: URL(string: url), urlCache: .imageCache) { image in
                        if let safeImage = image {
                            safeImage
                                .resizable()
                                .scaledToFill()
                        }
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    Image("noPhoto")
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(width: 80, height: 80)
            .cornerRadius(20)

            VStack(alignment: .leading) {
                Text(name ?? "Unknown")
                    .font(.title3)
                    .bold()
                Text(description ?? "No description available yet.")
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
            }
        }
        .frame(height: 100)
    }
}

struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(name: "Malenia", imageURL: "https://eldenring.fanapis.com/images/bosses/17f69b4ba0al0i1uk6s98t1nbtxunt.png", description: "The Blade's Miquella")
    }
}
