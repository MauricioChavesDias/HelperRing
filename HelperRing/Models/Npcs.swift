//
//  Npcs.swift
//  HelperRing
//
//  Created by Mauricio Dias on 28/10/2022.
//
///https://eldenring.fanapis.com/api/npcs

import Foundation

// MARK: - Npcs
struct Npcs: Codable {
    let success: Bool
    let count, total: Int
    let data: [Npc]
}

// MARK: - NPC
struct Npc: Codable {
    let id, name: String
    let image: String
    let quote: String?
    let location: String
    let role: String?
}
