//
//  MostViewed.swift
//  NyTimesKM
//
//  Created by Kareem Kareem on 4/21/19.
//  Copyright © 2019 Kareem Kareem. All rights reserved.
//

import Foundation

enum MostViewed {
    case day
    case week
    case month
}

extension MostViewed: Endpoint {
    var base: String {
        return "https://api.nytimes.com/svc/mostpopular/v2/viewed"
    }

    
    var path: String {
        switch self {
        case .day: return "/1.json"
        case .week: return "/7.json"
        case .month: return "/30.json"
        }
    }
}
