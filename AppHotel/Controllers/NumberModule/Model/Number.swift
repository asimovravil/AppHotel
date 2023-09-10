//
//  Number.swift
//  AppHotel
//
//  Created by Ravil on 10.09.2023.
//

import Foundation



struct NumberResponse: Codable {
    let rooms: [Room]
}

struct Room: Codable {
    let id: Int
    let name: String
    let price: Int
    let price_per: String
    let peculiarities: [String]
    let image_urls: [String]
}
