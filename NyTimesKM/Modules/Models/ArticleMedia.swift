//
//  ArticleMedia.swift
//  NyTimesKM
//
//  Created by Kareem Kareem on 4/22/19.
//  Copyright © 2019 Kareem Kareem. All rights reserved.
//

import Foundation


struct ArticleMedia: Decodable, Hashable {
    let type: String
    let metadata: [ArticleMediaInfo]?
    private enum CodingKeys: String, CodingKey {
        case  type, metadata = "media-metadata"
    }
}

struct ArticleMediaInfo: Codable, Hashable {
    let url: String?
    let format: String?
    let height: Int?
    let width: Int?
}
