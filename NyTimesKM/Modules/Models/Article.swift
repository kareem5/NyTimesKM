//
//  Article.swift
//  NyTimesKM
//
//  Created by Kareem Kareem on 4/21/19.
//  Copyright © 2019 Kareem Kareem. All rights reserved.
//

import Foundation

struct Article: Decodable, Hashable {
    
    let url: String
    let adxKeywords: String
    let section: String
    let byline: String
    let type: String
    let title: String
    let abstract: String
    let publishedDate: String
    let source: String
    let uri: String
    let media: [ArticleMedia]?
    
    var thumbnailURL: String? {
        let thumnailMedia = getArticleMediaInfo(format: "Standard Thumbnail")
        guard thumnailMedia != nil else {
            return nil
        }
        return thumnailMedia!.url
    }
    
    var mediumImageURL: String? {
        let thumnailMedia = getArticleMediaInfo(format: "mediumThreeByTwo210")
        guard thumnailMedia != nil else {
            return nil
        }
        return thumnailMedia!.url
    }
    
    var largeImageURL: String? {
        let thumnailMedia = getArticleMediaInfo(format: "mediumThreeByTwo440")
        guard thumnailMedia != nil else {
            return nil
        }
        return thumnailMedia!.url
    }
    
    
    enum CodingKeys: String, CodingKey {
        case url
        case adxKeywords = "adx_keywords"
        case section
        case byline
        case type
        case title
        case abstract
        case publishedDate = "published_date"
        case source
        case uri
        case media
    }
    
    func getArticleMediaInfo (format: String) -> ArticleMediaInfo? {
        guard media != nil, media!.count > 0 else {
            return nil
        }
        let firstMedia = media![0]
        let metadata = firstMedia.metadata
        guard firstMedia.type == "image", metadata != nil, metadata!.count > 0 else {
            return nil
        }
        return metadata!.filter {$0.format == format}[0]
    }

}
