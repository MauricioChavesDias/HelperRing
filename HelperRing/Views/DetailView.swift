//
//  DetailView.swift
//  HelperRing
//
//  Created by Mauricio Dias on 21/10/2022.
//

import SwiftUI
import CachedAsyncImage

struct DetailView: View {
    @State var item: Data
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 15) {
                imageHeader
                title
            }
            VStack(spacing: 20) {
                description
                StatusBannerView(healthPoints: item.healthPoints, location: item.location, region: item.region, dropList: item.drops)
            }
        }
    }
    
    
    //MARK: Elements
    var imageHeader: some View {
        Group {
            if let imageURL = item.image {
                CachedAsyncImage(url: URL(string: imageURL), urlCache: .imageCache) { phase in
                    if let safeImage = phase.image {
                        safeImage
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Image("noPhoto")
                            .resizable()
                            .scaledToFit()
                    } else {
                        ProgressView()
                            .tint(Color("darkGreen"))
                    }
                }
            }
        }
        .frame(width: 350,height: 250)
        .cornerRadius(25)
        .shadow(color: .secondary, radius: 2, x: -2, y: -2)
        .shadow(color: .secondary, radius: 2, x: 2, y: 2)
        
    }

    var title: some View {
        Text(item.name)
            .font(Font.custom("Mantinia", size: 32))
            .multilineTextAlignment(.center)
    }

    var description: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Description")
                .font(.caption)
                .foregroundColor(Color("darkYellow"))
            if let description = item.description {
                Text(description)
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.leading,8)
        .padding(.trailing,8)
        .padding(.top, 5)
    }

    struct StatusBannerView: View {
        @State var healthPoints: String?
        @State var location: String?
        @State var region: String?
        @State var dropList: [String]?
        
        let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        
        var body: some View {
            VStack {
                Text("Info")
                    .font(.callout)
                    .bold()
                    .foregroundColor(Color("darkYellow"))
                    .padding()
                
                if let hp = healthPoints,
                   !hp.isEmpty,
                   let cleanHPString = hp.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(){
                    if let myHPNumber = NumberFormatter().number(from: cleanHPString),
                       let myHPIntNumber = myHPNumber.doubleValue {
                        CustomProgressBar(title: "Health Points", value: myHPIntNumber, total: 30000)
                            .frame(height: 40)
                    }
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: 15) {
                        if let local = location {
                            VStack(alignment: .leading) {
                                Text("Location")
                                    .font(.caption)
                                    .foregroundColor(Color("darkYellow"))
                                    .italic()
                                Text(local)
                                    .font(.callout)
                            }
                        }
                        
                        if let regionName = region,
                           let safeRegion = regionName.lowercased().trimmingCharacters(in: .whitespacesAndNewlines),
                           Constants.isThereAnyPhotoInTheAssets(imageName: safeRegion) {
                            VStack(alignment: .leading) {
                                Text("Region")
                                    .font(.caption)
                                    .foregroundColor(Color("darkYellow"))
                                    .italic()
                                Image(safeRegion)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)
                                    .opacity(0.9)
                            }
                        }
                        
                        if let drops = dropList,
                           drops.count > 0 {
                            VStack(alignment: .leading) {
                                Text("Drops")
                                    .font(.caption)
                                    .foregroundColor(Color("darkYellow"))
                                    .italic()
                                VStack(alignment: .leading) {
                                    ForEach(drops, id: \.self) { drop in
                                        Text("* \(drop)")
                                            .font(.callout)
                                    }
                                }
                            }
                        }
                    }
                    Spacer()
                }
                .padding()
                
            }
            .background(.regularMaterial)
            .frame(width: 280)
            .cornerRadius(25)
            .shadow(color: .black,radius: 5)
        }
    }

}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let itemPreview =
        Data(
            itemID: "1",
            name: "Ancient Dragon Lansseax",
            image: "https://eldenring.fanapis.com/images/bosses/17f69a63610l0i1ukyx7xgx6vf0zoa.png",
            description: "A hostile, massive Dragon-Fly creature. Menacing and extremely powerful.",
            drops: ["13.000 Runes", "Ancestral Follower Ashes"],
            healthPoints: "2220",
            region: "Caelid",
            location: "Consecrated Snowfield",
            cardItem: .bosses
        )
        
        
        DetailView(item: itemPreview)
            .previewDevice("iPhone 14")
        
    }
}
