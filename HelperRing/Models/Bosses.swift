//
//  Bosses.swift
//  HelperRing
//
//  Created by Mauricio Dias on 18/10/2022.
//
// https://eldenring.fanapis.com/api/bosses
//{
//  "success": true,
//  "data": {
//    "id": "17f69b4ba0al0i1uk6s98t1nbtxunt",
//    "name": "Alecto, Black Knife Ringleader",
//    "image": "https://eldenring.fanapis.com/images/bosses/17f69b4ba0al0i1uk6s98t1nbtxunt.png",
//    "region": "Liurnia of the Lakes",
//    "description": "Remarkably agile and aggressive warrior. Dangerous even for those with shield coverage...",
//    "location": "Ringleader's Evergoal, Liurnia of the Lakes",
//    "drops": [
//      "8.000 Runes",
//      "Black Knife Tiche"
//    ],
//    "healthPoints": "???"
//  }
//}

import Foundation

// MARK: - Bosses
struct Bosses: Codable {
    let success: Bool
    let count, total: Int
    let data: [Boss]
}

// MARK: - Boss
struct Boss: Codable {
    let id, name: String
    let image: String?
    let region, datumDescription, location: String
    let drops: [String]?
    var healthPoints: String? 

    enum CodingKeys: String, CodingKey {
        case id, name, image, region
        case datumDescription = "description"
        case location, drops, healthPoints
    }
}
