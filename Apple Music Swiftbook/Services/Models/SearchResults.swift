//
//  PodcastResponse.swift
//  PodcastsApp
//
//  Created by Алексей Пархоменко on 07/07/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation

struct SearchResults: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    let trackName: String?
    let artistName: String?
    let artworkUrl100: String?
    let collectionName: String?
    let wrapperType: String?
    let trackViewUrl: String?
    let artistViewUrl: String?
    let collectionViewUrl: String?
}


