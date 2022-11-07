//
//  BossService.swift
//  HelperRing
//
//  Created by Mauricio Dias on 19/10/2022.
//

import Foundation

protocol HelperRingServiceable {
    //Ammos
    func getAmmos(page: Int, searchTerm: String) async -> Result<Ammos, RequestError>
    
//    //Armors
    func getArmors(page: Int, searchTerm: String) async -> Result<Armors, RequestError>

//    //AshesOfWar
    func getAshesOfWar(page: Int, searchTerm: String) async -> Result<AshesOfWar, RequestError>

//    //Bosses
    func getBosses(page: Int, searchTerm: String) async -> Result<Bosses, RequestError>

//    //Classes
    func getClasses(page: Int, searchTerm: String) async -> Result<Classes, RequestError>

//    //Creatures
    func getCreatures(page: Int, searchTerm: String) async -> Result<Creatures, RequestError>

//    //Incantations
    func getIncantations(page: Int, searchTerm: String) async -> Result<Incantations, RequestError>

//    //Items
    func getItems(page: Int, searchTerm: String) async -> Result<Items, RequestError>

//    //Locations
    func getLocations(page: Int, searchTerm: String) async -> Result<Locations, RequestError>

//    //NPCS
    func getNPCS(page: Int, searchTerm: String) async -> Result<Npcs, RequestError>

//    //Shields
    func getShields(page: Int, searchTerm: String) async -> Result<Shields, RequestError>

//    //Sorceries
    func getSorceries(page: Int, searchTerm: String) async -> Result<Sorceries, RequestError>

//    //Spirits
    func getSpirits(page: Int, searchTerm: String) async -> Result<Spirits, RequestError>

//    //Talisman
    func getTalismans(page: Int, searchTerm: String) async -> Result<Talismans, RequestError>

//    //Weapons
    func getWeapons(page: Int, searchTerm: String) async -> Result<Weapons, RequestError>
}

struct HelperRingService: HTTPClient, HelperRingServiceable {
    
    //Ammos
    func getAmmos(page: Int, searchTerm: String) async -> Result<Ammos, RequestError> {
        return await sendRequest(endpoint: HelperRingEndpoint.ammos, responseModel: Ammos.self, page: page, searchTerm: searchTerm)
    }

    //Armors
    func getArmors(page: Int, searchTerm: String) async -> Result<Armors, RequestError> {
        return await sendRequest(endpoint: HelperRingEndpoint.armors, responseModel: Armors.self, page: page, searchTerm: searchTerm)
    }

    //AshesOfWar
    func getAshesOfWar(page: Int, searchTerm: String) async -> Result<AshesOfWar, RequestError> {
        return await sendRequest(endpoint: HelperRingEndpoint.ashesOfWar, responseModel: AshesOfWar.self, page: page, searchTerm: searchTerm)
    }

    //Bosses
    func getBosses(page: Int, searchTerm: String) async -> Result<Bosses, RequestError> {
        return await sendRequest(endpoint: HelperRingEndpoint.bosses, responseModel: Bosses.self, page: page, searchTerm: searchTerm)
    }
    
    //Classes
    func getClasses(page: Int, searchTerm: String) async -> Result<Classes, RequestError> {
        return await sendRequest(endpoint: HelperRingEndpoint.classes, responseModel: Classes.self, page: page, searchTerm: searchTerm)
    }

    //Creatures
    func getCreatures(page: Int, searchTerm: String) async -> Result<Creatures, RequestError> {
        return await sendRequest(endpoint: HelperRingEndpoint.creatures, responseModel: Creatures.self, page: page, searchTerm: searchTerm)
    }
    
    //Incantations
    func getIncantations(page: Int, searchTerm: String) async -> Result<Incantations, RequestError> {
        return await sendRequest(endpoint: HelperRingEndpoint.incantations, responseModel: Incantations.self, page: page, searchTerm: searchTerm)
    }

    //Items
    func getItems(page: Int, searchTerm: String) async -> Result<Items, RequestError> {
        return await sendRequest(endpoint: HelperRingEndpoint.items, responseModel: Items.self, page: page, searchTerm: searchTerm)
    }

    //Locations
    func getLocations(page: Int, searchTerm: String) async -> Result<Locations, RequestError> {
        return await sendRequest(endpoint: HelperRingEndpoint.locations, responseModel: Locations.self, page: page, searchTerm: searchTerm)
    }

    //NPCS
    func getNPCS(page: Int, searchTerm: String) async -> Result<Npcs, RequestError> {
        return await sendRequest(endpoint: HelperRingEndpoint.npcs, responseModel: Npcs.self, page: page, searchTerm: searchTerm)
    }

    //Shields
    func getShields(page: Int, searchTerm: String) async -> Result<Shields, RequestError> {
        return await sendRequest(endpoint: HelperRingEndpoint.shields, responseModel: Shields.self, page: page, searchTerm: searchTerm)
    }

    //Sorceries
    func getSorceries(page: Int, searchTerm: String) async -> Result<Sorceries, RequestError> {
        return await sendRequest(endpoint: HelperRingEndpoint.sorceries, responseModel: Sorceries.self, page: page, searchTerm: searchTerm)
    }

    //Spirits
    func getSpirits(page: Int, searchTerm: String) async -> Result<Spirits, RequestError> {
        return await sendRequest(endpoint: HelperRingEndpoint.spirits, responseModel: Spirits.self, page: page, searchTerm: searchTerm)
    }

    //Talismans
    func getTalismans(page: Int, searchTerm: String) async -> Result<Talismans, RequestError> {
        return await sendRequest(endpoint: HelperRingEndpoint.talismans, responseModel: Talismans.self, page: page, searchTerm: searchTerm)
    }

    //Weapons
    func getWeapons(page: Int, searchTerm: String) async -> Result<Weapons, RequestError> {
        return await sendRequest(endpoint: HelperRingEndpoint.weapons, responseModel: Weapons.self, page: page, searchTerm: searchTerm)
    }
}
