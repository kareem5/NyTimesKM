//
//  Endpoint.swift
//  NyTimesKM
//
//  Created by Kareem Kareem on 4/21/19.
//  Copyright © 2019 Kareem Kareem. All rights reserved.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
}

extension Endpoint {
    var apiKey: String {
        return "api-key=SxeItPELISOKIc1XUzsNf5zdkQRTJ7qz"
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base + path)!
        components.query = apiKey
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        let request = URLRequest(url: url)
        return request
    }
    
}
