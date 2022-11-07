//
//  HomeViewModel.swift
//  HelperRing
//
//  Created by Mauricio Dias on 20/10/2022.
//

import Foundation

enum CardItemType: String {
    case armors = "Armors"
    case ammos = "Ammos"
    case ashesOfWar = "AshesOfWar"
    case bosses = "Bosses"
    case classes = "Classes"
    case creatures = "Creatures"
    case incantations = "Incantations"
    case items = "Items"
    case locations = "Locations"
    case npcs = "NPCs"
    case shields = "Shields"
    case sorceries = "Sorceries"
    case spirits = "Spirits"
    case talismans = "Talismans"
    case weapons = "Weapons"
}

@MainActor
final class HomeViewModel: ObservableObject {
    
    private let service = HelperRingService()

    @Published var itemsList = [Data]()
    @Published var totalItems = 0
    @Published var countItems = 0

    
    
    func fetchData(selectedCardItem: CardItemType, page: Int, searchTerm: String) async {
        switch selectedCardItem {
        case .armors:
            await fetchArmors(page: page, searchTerm: searchTerm)
        case .ammos:
            await fetchAmmos(page: page, searchTerm: searchTerm)
        case .ashesOfWar:
            await fetchAshesOfWar(page: page, searchTerm: searchTerm)
        case .bosses:
            await fetchBosses(page: page, searchTerm: searchTerm)
        case .classes:
            await fetchClasses(page: page, searchTerm: searchTerm)
        case .creatures:
            await fetchCreatures(page: page, searchTerm: searchTerm)
        case .incantations:
            await fetchIncantations(page: page, searchTerm: searchTerm)
        case .items:
            await fetchItems(page: page, searchTerm: searchTerm)
        case .locations:
            await fetchLocations(page: page, searchTerm: searchTerm)
        case .npcs:
            await fetchNpcs(page: page, searchTerm: searchTerm)
        case .shields:
            await fetchShields(page: page, searchTerm: searchTerm)
        case .sorceries:
            await fetchSorceries(page: page, searchTerm: searchTerm)
        case .spirits:
            await fetchSpirits(page: page, searchTerm: searchTerm)
        case .talismans:
            await fetchTalismans(page: page, searchTerm: searchTerm)
        case .weapons:
            await fetchWeapons(page: page, searchTerm: searchTerm)
        }
    }
    
    
    //MARK: Fetch Data Functions
    
    //Ammos
    func fetchAmmos(page: Int, searchTerm: String) async {
        let result = await service.getAmmos(page: page, searchTerm: searchTerm)
        switch result {
        case .success(let ammoResponse):
            totalItems = ammoResponse.total
            countItems = ammoResponse.count
            prepareListForFilteredData(from: page)
            ammoResponse.data.forEach { ammo in
                self.itemsList.append(
                    Data(
                        itemID: ammo.id,
                        name: ammo.name,
                        image: ammo.image,
                        description: ammo.datumDescription,
                        drops: nil,
                        healthPoints: nil,
                        region: nil,
                        location: nil,
                        cardItem: .ammos
                    )
                )
            }
        case .failure(let error):
            print(error.customMessage)
        }
    }
    
    //Armors
    func fetchArmors(page: Int, searchTerm: String) async {
        let result = await service.getArmors(page: page, searchTerm: searchTerm)
        switch result {
        case .success(let armorsResponse):
            totalItems = armorsResponse.total
            countItems = armorsResponse.count
            prepareListForFilteredData(from: page)
            armorsResponse.data.forEach { armor in
                self.itemsList.append(
                    Data(
                        itemID: armor.id,
                        name: armor.name,
                        image: armor.image,
                        description: armor.datumDescription,
                        drops: nil,
                        healthPoints: nil,
                        region: nil,
                        location: nil,
                        cardItem: .armors
                    )
                )
            }
        case .failure(let error):
            print(error.customMessage)
        }
    }

    //AshesOfWar
    func fetchAshesOfWar(page: Int, searchTerm: String) async {
        let result = await service.getAshesOfWar(page: page, searchTerm: searchTerm)
        switch result {
        case .success(let asheOfWarResponse):
            totalItems = asheOfWarResponse.total
            countItems = asheOfWarResponse.count
            prepareListForFilteredData(from: page)
            asheOfWarResponse.data.forEach { ashOfWar in
                self.itemsList.append(
                    Data(
                        itemID: ashOfWar.id,
                        name: ashOfWar.name,
                        image: ashOfWar.image,
                        description: ashOfWar.datumDescription,
                        drops: nil,
                        healthPoints: nil,
                        region: nil,
                        location: nil,
                        cardItem: .ashesOfWar
                    )
                )
            }
        case .failure(let error):
            print(error.customMessage)
        }
    }

    //Bosses
    func fetchBosses(page: Int, searchTerm: String) async {
        let result = await service.getBosses(page: page, searchTerm: searchTerm)
        switch result {
        case .success(let bossesResponse):
            totalItems = bossesResponse.total
            countItems = bossesResponse.count
            prepareListForFilteredData(from: page)
            bossesResponse.data.forEach { boss in
                self.itemsList.append(
                    Data(
                        itemID: boss.id,
                        name: boss.name,
                        image: boss.image,
                        description: boss.datumDescription,
                        drops: boss.drops,
                        healthPoints: boss.healthPoints,
                        region: boss.region,
                        location: boss.location,
                        cardItem: .bosses
                    )
                )
            }
        case .failure(let error):
            print(error.customMessage)
        }
    }

    //Classes
    func fetchClasses(page: Int, searchTerm: String) async {
        let result = await service.getClasses(page: page, searchTerm: searchTerm)
        switch result {
        case .success(let classesResponse):
            totalItems = classesResponse.total
            countItems = classesResponse.count
            prepareListForFilteredData(from: page)
            classesResponse.data.forEach { classe in
                self.itemsList.append(
                    Data(
                        itemID: classe.id,
                        name: classe.name,
                        image: classe.image,
                        description: classe.datumDescription,
                        drops: nil,
                        healthPoints: nil,
                        region: nil,
                        location: nil,
                        cardItem: .classes
                    )
                )
            }
        case .failure(let error):
            print(error.customMessage)
        }
    }

    //Creatures
    func fetchCreatures(page: Int, searchTerm: String) async {
        let result = await service.getCreatures(page: page, searchTerm: searchTerm)
        switch result {
        case .success(let creaturesResponse):
            totalItems = creaturesResponse.total
            countItems = creaturesResponse.count
            prepareListForFilteredData(from: page)
            creaturesResponse.data.forEach { creature in
                self.itemsList.append(
                    Data(
                        itemID: creature.id,
                        name: creature.name,
                        image: creature.image,
                        description: creature.datumDescription,
                        drops: nil,
                        healthPoints: nil,
                        region: nil,
                        location: nil,
                        cardItem: .creatures
                    )
                )
            }
        case .failure(let error):
            print(error.customMessage)
        }
    }

    //Incantations
    func fetchIncantations(page: Int, searchTerm: String) async {
        let result = await service.getIncantations(page: page, searchTerm: searchTerm)
        switch result {
        case .success(let incantationsResponse):
            totalItems = incantationsResponse.total
            countItems = incantationsResponse.count
            prepareListForFilteredData(from: page)
            incantationsResponse.data.forEach { incantation in
                self.itemsList.append(
                    Data(
                        itemID: incantation.id,
                        name: incantation.name,
                        image: incantation.image,
                        description: incantation.datumDescription,
                        drops: nil,
                        healthPoints: nil,
                        region: nil,
                        location: nil,
                        cardItem: .incantations
                    )
                )
            }
        case .failure(let error):
            print(error.customMessage)
        }
    }

    //Items
    func fetchItems(page: Int, searchTerm: String) async {
        let result = await service.getItems(page: page, searchTerm: searchTerm)
        switch result {
        case .success(let itemsResponse):
            totalItems = itemsResponse.total
            countItems = itemsResponse.count
            prepareListForFilteredData(from: page)
            itemsResponse.data.forEach { item in
                self.itemsList.append(
                    Data(
                        itemID: item.id,
                        name: item.name,
                        image: item.image,
                        description: item.datumDescription,
                        drops: nil,
                        healthPoints: nil,
                        region: nil,
                        location: nil,
                        cardItem: .items
                    )
                )
            }
        case .failure(let error):
            print(error.customMessage)
        }
    }

    //Locations
    func fetchLocations(page: Int, searchTerm: String) async {
        let result = await service.getLocations(page: page, searchTerm: searchTerm)
        switch result {
        case .success(let locationsResponse):
            totalItems = locationsResponse.total
            countItems = locationsResponse.count
            prepareListForFilteredData(from: page)
            locationsResponse.data.forEach { location in
                self.itemsList.append(
                    Data(
                        itemID: location.id,
                        name: location.name,
                        image: location.image,
                        description: location.datumDescription,
                        drops: nil,
                        healthPoints: nil,
                        region: nil,
                        location: nil,
                        cardItem: .locations
                    )
                )
            }
        case .failure(let error):
            print(error.customMessage)
        }
    }

    //Npcs
    func fetchNpcs(page: Int, searchTerm: String) async {
        let result = await service.getNPCS(page: page, searchTerm: searchTerm)
        switch result {
        case .success(let npcsResponse):
            totalItems = npcsResponse.total
            countItems = npcsResponse.count
            prepareListForFilteredData(from: page)
            npcsResponse.data.forEach { npc in
                self.itemsList.append(
                    Data(
                        itemID: npc.id,
                        name: npc.name,
                        image: npc.image,
                        description: nil,
                        drops: nil,
                        healthPoints: nil,
                        region: nil,
                        location: nil,
                        cardItem: .npcs
                    )
                )
            }
        case .failure(let error):
            print(error.customMessage)
        }
    }

    //Shields
    func fetchShields(page: Int, searchTerm: String) async {
        let result = await service.getShields(page: page, searchTerm: searchTerm)
        switch result {
        case .success(let shieldsResponse):
            totalItems = shieldsResponse.total
            countItems = shieldsResponse.count
            prepareListForFilteredData(from: page)
            shieldsResponse.data.forEach { shield in
                self.itemsList.append(
                    Data(
                        itemID: shield.id,
                        name: shield.name,
                        image: shield.image,
                        description: shield.datumDescription,
                        drops: nil,
                        healthPoints: nil,
                        region: nil,
                        location: nil,
                        cardItem: .shields
                    )
                )
            }
        case .failure(let error):
            print(error.customMessage)
        }
    }

    //Sorceries
    func fetchSorceries(page: Int, searchTerm: String) async {
        let result = await service.getSorceries(page: page, searchTerm: searchTerm)
        switch result {
        case .success(let sorceriesResponse):
            totalItems = sorceriesResponse.total
            countItems = sorceriesResponse.count
            prepareListForFilteredData(from: page)
            sorceriesResponse.data.forEach { sorcerie in
                self.itemsList.append(
                    Data(
                        itemID: sorcerie.id,
                        name: sorcerie.name,
                        image: sorcerie.image,
                        description: sorcerie.datumDescription,
                        drops: nil,
                        healthPoints: nil,
                        region: nil,
                        location: nil,
                        cardItem: .sorceries
                    )
                )
            }
        case .failure(let error):
            print(error.customMessage)
        }
    }

    //Spirits
    func fetchSpirits(page: Int, searchTerm: String) async {
        let result = await service.getSpirits(page: page, searchTerm: searchTerm)
        switch result {
        case .success(let spiritsResponse):
            totalItems = spiritsResponse.total
            countItems = spiritsResponse.count
            prepareListForFilteredData(from: page)
            spiritsResponse.data.forEach { spirit in
                self.itemsList.append(
                    Data(
                        itemID: spirit.id,
                        name: spirit.name,
                        image: spirit.image,
                        description: spirit.datumDescription,
                        drops: nil,
                        healthPoints: nil,
                        region: nil,
                        location: nil,
                        cardItem: .spirits
                    )
                )
            }
        case .failure(let error):
            print(error.customMessage)
        }
    }

    //Talismans
    func fetchTalismans(page: Int, searchTerm: String) async {
        let result = await service.getTalismans(page: page, searchTerm: searchTerm)
        switch result {
        case .success(let talismansResponse):
            totalItems = talismansResponse.total
            countItems = talismansResponse.count
            prepareListForFilteredData(from: page)
            talismansResponse.data.forEach { talisman in
                self.itemsList.append(
                    Data(
                        itemID: talisman.id,
                        name: talisman.name,
                        image: talisman.image,
                        description: talisman.datumDescription,
                        drops: nil,
                        healthPoints: nil,
                        region: nil,
                        location: nil,
                        cardItem: .talismans
                    )
                )
            }
        case .failure(let error):
            print(error.customMessage)
        }
    }

    //Weapons
    func fetchWeapons(page: Int, searchTerm: String) async {
        let result = await service.getWeapons(page: page, searchTerm: searchTerm)
        switch result {
        case .success(let weaponsResponse):
            totalItems = weaponsResponse.total
            countItems = weaponsResponse.count
            prepareListForFilteredData(from: page)
            weaponsResponse.data.forEach { weapon in
                self.itemsList.append(
                    Data(
                        itemID: weapon.id,
                        name: weapon.name,
                        image: weapon.image,
                        description: weapon.datumDescription,
                        drops: nil,
                        healthPoints: nil,
                        region: nil,
                        location: nil,
                        cardItem: .weapons
                    )
                )
            }
        case .failure(let error):
            print(error.customMessage)
        }
    }
    
    func shouldLoadMoreData(item: Data) -> Bool {
         let index = itemsList.firstIndex(where: {$0.itemID == item.itemID}) // get the index of the items
         return index == (itemsList.count - 1) && itemsList.count < totalItems && countItems == 20
    }
    
    func prepareListForFilteredData(from page: Int) {
        if page == 0 {
            self.itemsList.removeAll()
        }
    }
}
