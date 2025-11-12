//
//  TravelPackage.swift
//  Getaway
//
//  Created by Andrés Serna on 11/11/25.
//

import Foundation

struct TravelPackage: Codable {
    let destination_name: String
    let trip_START: String
    let trip_END: String
    let hotels: [Hotel]
    let entertainment: [Entertainment]
}

struct Hotel: Codable {
    let hotel_name: String
    let hotel_description: String
    let hotel_latitude: Double
    let hotel_longitude: Double
}

struct Entertainment: Codable {
    let entertainment_name: String
    let entertainment_description: String
    let entertainment_latitude: Double
    let entertainment_longitude: Double
}

func loadPackages() -> [TravelPackage] {
    guard let url = Bundle.main.url(forResource: "packages", withExtension: "json") else {
        print("packages.json not found in app bundle")
        return []
    }

    do {
        let data = try Data(contentsOf: url)
        let packages = try JSONDecoder().decode([TravelPackage].self, from: data)
        return packages
    } catch {
        print("Failed to decode packages.json: \(error)")
        return []
    }
}
