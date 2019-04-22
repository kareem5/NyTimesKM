//
//  ArticleDetailsViewModel.swift
//  NyTimesKM
//
//  Created by Kareem Kareem on 4/22/19.
//  Copyright © 2019 Kareem Kareem. All rights reserved.
//

import Foundation

class ArticleDetailsViewModel {
    private var article: Article
    
    init(article: Article) {
        self.article = article
    }
    
    var articleTitle: String {
        return article.title
    }
    
    var articleByline: String {
        return article.byline
    }
    
    var publishedDate: String {
        return article.publishedDate
    }
    
    var articleAbstract: String {
        return article.abstract
    }
    
    var articleImageUrl: String? {
        if let imageUrl = article.mediumImageURL {
            return imageUrl
        }
        return nil
    }
    
    
    
}
