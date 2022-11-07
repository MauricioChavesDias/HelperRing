//
//  HomeDetail.swift
//  HelperRing
//
//  Created by Mauricio Dias on 19/10/2022.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var viewModel: HomeViewModel
//    @StateObject var viewModel = HomeViewModel()
    
    let selectedCard: CardItemType
    @State private var isSearching = false
    @State private var currentPage = 0
    @State private var searchText = ""
    
    var searchResults: [Data] {
        //if searchText.isEmpty {
            return viewModel.itemsList.filter { $0.cardItem == selectedCard }
       // }
//        else {
//            return viewModel.itemsList.filter { $0.name.contains(searchText) }
//        }
    }
    
    var body: some View {
        ZStack {
                List {
                    ForEach(searchResults, id: \.itemID) { item in
                        NavigationLink {
                            DetailView(item: item)
                        } label: {
                            ItemRow(name: item.name, imageURL: item.image, description: item.description ?? "N/A")
                                .task {
                                    if viewModel.shouldLoadMoreData(item: item) {
                                        currentPage += 1
                                        await viewModel.fetchData(selectedCardItem: selectedCard, page: currentPage, searchTerm: searchText)
                                    }
                                }
                        }
                    }
                }
                .navigationTitle(selectedCard.rawValue)
                .searchable(text: $searchText)
                .task {
                    if searchResults.count == 0 {
                        print("task has been triggered! ")
                        await viewModel.fetchData(selectedCardItem: selectedCard, page: currentPage, searchTerm: "")
                    }
                }
                .onChange(of: searchText) { text in
                    Task {
                        if !text.isEmpty && text.count > 3 {
                            isSearching = true
                        } else if text.isEmpty {
                            isSearching = false
                        }
                        if self.isSearching {
                            currentPage = 0
                            await viewModel.fetchData(selectedCardItem: selectedCard, page: currentPage, searchTerm: searchText)
                        } else if !isSearching {
                            currentPage = 0
                            await viewModel.fetchData(selectedCardItem: selectedCard, page: currentPage, searchTerm: "")
                        }
                    }
                }
//            } else {
//                LoadingView()
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .task {
//                        await viewModel.fetchData(selectedCardItem: selectedCard, page: currentPage, searchTerm: "")
//                    }
//            }
        }
    }
    
}

struct HomeDetail_Previews: PreviewProvider {
    static var previews: some View {
        ListView(selectedCard: .bosses)
            .environmentObject(HomeViewModel())
    }
}
