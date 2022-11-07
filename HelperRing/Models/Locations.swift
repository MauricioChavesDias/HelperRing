//
//  Locations.swift
//  HelperRing
//
//  Created by Mauricio Dias on 28/10/2022.
//
///https://eldenring.fanapis.com/api/locations

import Foundation

// MARK: - Locations
struct Locations: Codable {
    let success: Bool
    let count, total: Int
    let data: [Location]
}

// MARK: - Datum
struct Location: Codable {
    let id, name: String
    let image: String
    let region: Region
    let datumDescription: String

    enum CodingKeys: String, CodingKey {
        case id, name, image, region
        case datumDescription = "description"
    }
}

enum Region: String, Codable {
    case limgrave = "Limgrave"
}
