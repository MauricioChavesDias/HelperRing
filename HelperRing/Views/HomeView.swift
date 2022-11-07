//
//  DashboardView.swift
//  HelperRing
//
//  Created by Mauricio Dias on 18/10/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    private let cards: [CardItem] = [
        CardItem(title: "Ammos", image: "ammosIcon", selectedCard: .ammos),
        CardItem(title: "Armors", image: "armorsIcon", selectedCard: .armors),
        CardItem(title: "Classes", image: "classesIcon", selectedCard: .classes),
        CardItem(title: "Creatures", image: "creaturesIcon", selectedCard: .creatures),
        CardItem(title: "Bosses", image: "bossIcon", selectedCard: .bosses),
        CardItem(title: "Incantations", image: "incantationsIcon", selectedCard: .incantations),
        CardItem(title: "Items", image: "itemsIcon", selectedCard: .items),
        CardItem(title: "Locations", image: "locationsIcon", selectedCard: .locations),
        CardItem(title: "NPCs", image: "npcsIcon", selectedCard: .npcs),
        CardItem(title: "Shields", image: "shieldsIcon", selectedCard: .shields),
        CardItem(title: "Sorceries", image: "sorceriesIcon", selectedCard: .sorceries),
        CardItem(title: "Spirits", image: "spiritsIcon", selectedCard: .spirits),
        CardItem(title: "Talismans", image: "talismansIcon", selectedCard: .talismans),
        CardItem(title: "Weapons", image: "weaponsIcon", selectedCard: .weapons),
    ]
    
    let columnsLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columnsLayout, spacing: 10) {
                    ForEach(cards, id: \.self) { card in
                        NavigationLink {
                            ListView(selectedCard: card.selectedCard)
                                .environmentObject(viewModel)
                        } label: {
                            CardRow(title: card.title, imageName: card.image)
                        }
                    }
                }
                .padding(.top, 20)
                .padding(.trailing, 10)
                .padding(.leading, 10)
            }
            .navigationTitle("Home")
        }
        .onAppear {
            //Use this to change settings from the navigationTitle
            UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name:"Mantinia", size: 40)!, .foregroundColor: UIColor(.accentColor)]
        }
        .background(Image("background"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
