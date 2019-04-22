//
//  MovieClient.swift
//  NyTimesKM
//
//  Created by Kareem Kareem on 4/21/19.
//  Copyright © 2019 Kareem Kareem. All rights reserved.
//

import Foundation

class ArticlesClient: APIClient {
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getFeeds(from movieFeedType: MostViewed, completion: @escaping (APIResult<ArticlesResult, APIError>) -> Void) {
        
        fetch(with: movieFeedType.request, decode: { json -> ArticlesResult? in
            guard let movieFeedResult = json as? ArticlesResult else { return nil }
            return movieFeedResult
        }, completion: completion)
    }
    
}
