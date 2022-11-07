//
//  BossEndpoint.swift
//  HelperRing
//
//  Created by Mauricio Dias on 19/10/2022.
//

import Foundation

enum HelperRingEndpoint {
    case ammos
    case ammo(id: String)
    case armors
    case armor(id: String)
    case ashesOfWar
    case ashOfWar(id: String)
    case bosses
    case boss(id: String)
    case classes
    case classe(id: String)
    case creatures
    case creature(id: String)
    case incantations
    case incantation(id: String)
    case items
    case item(id: String)
    case locations
    case location(id: String)
    case npcs
    case npc(id: String)
    case shields
    case shield(id: String)
    case sorceries
    case sorcery(id: String)
    case spirits
    case spirit(id: String)
    case talismans
    case talisman(id: String)
    case weapons
    case weapon(id: String)
}

extension HelperRingEndpoint: Endpoint {
    var path: String {
        switch self {
        case .ammos:
            return host + "ammos"
        case .ammo(id: let id):
            return host + "ammos/" + id
        case .armors:
            return host + "armors"
        case .armor(id: let id):
            return host + "armors/" + id
        case .ashesOfWar:
            return host + "ashes"
        case .ashOfWar(id: let id):
            return host + "ashes/" + id
        case .bosses:
            return host + "bosses"
        case .boss(let id):
            return host + "bosses/" + id
        case .classes:
            return host + "classes"
        case .classe(id: let id):
            return host + "classes/" + id
        case .creatures:
            return host + "creatures"
        case .creature(id: let id):
            return host + "creatures/" + id
        case .incantations:
            return host + "incantations"
        case .incantation(id: let id):
            return host + "incantations/" + id
        case .items:
            return host + "items"
        case .item(id: let id):
            return host + "items/" + id
        case .locations:
            return host + "locations"
        case .location(id: let id):
            return host + "locations/" + id
        case .npcs:
            return host + "npcs"
        case .npc(id: let id):
            return host + "npcs/" + id
        case .shields:
            return host + "shields"
        case .shield(id: let id):
            return host + "shields/" + id
        case .sorceries:
            return host + "sorceries"
        case .sorcery(id: let id):
            return host + "sorceries/" + id
        case .spirits:
            return host + "spirits"
        case .spirit(id: let id):
            return host + "spirits/" + id
        case .talismans:
            return host + "talismans"
        case .talisman(id: let id):
            return host + "talismans/" + id
        case .weapons:
            return host + "weapons"
        case .weapon(id: let id):
            return host + "weapons/" + id
        }
    }

    var method: RequestMethod {
        switch self {
        case .ammos,.ammo, .armors,. armor, .ashesOfWar, .ashOfWar, .bosses, .boss, .classes, .classe, .creatures, .creature, .incantations, .incantation, .items, .item, .locations, .location, .npcs, .npc, .shields, .shield, .sorceries, .sorcery, .spirits, .spirit, .talismans, .talisman, .weapons, .weapon:
            return .get
        }
    }

    var header: [String: String]? {
        // Access Token to use in the header
        //let accessToken = "insert your access token here"
        switch self {
        case .ammos,.ammo, .armors,. armor, .ashesOfWar, .ashOfWar, .bosses, .boss, .classes, .classe, .creatures, .creature, .incantations, .incantation, .items, .item, .locations, .location, .npcs, .npc, .shields, .shield, .sorceries, .sorcery, .spirits, .spirit, .talismans, .talisman, .weapons, .weapon:
            return [
                "Authorization": "",
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }

    var body: [String: String]? {
        switch self {
        case .ammos,.ammo, .armors,. armor, .ashesOfWar, .ashOfWar, .bosses, .boss, .classes, .classe, .creatures, .creature, .incantations, .incantation, .items, .item, .locations, .location, .npcs, .npc, .shields, .shield, .sorceries, .sorcery, .spirits, .spirit, .talismans, .talisman, .weapons, .weapon:
            return nil
        }
    }
}
