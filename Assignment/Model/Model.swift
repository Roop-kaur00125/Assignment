//
//  Model.swift
//  Assignment
//
//  Created by Rupinder Kaur on 18/07/22.
//  Copyright © 2022 Rupinder Kaur. All rights reserved.
//

import Foundation

// MARK: - Response
struct Response: Codable {
    let tracks: [Track]
}

// MARK: - Track
struct Track: Codable {
    let layout, type, key, title: String
    let subtitle: String
    let url: String
}


