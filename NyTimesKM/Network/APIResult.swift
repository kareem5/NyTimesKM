//
//  APIResult.swift
//  NyTimesKM
//
//  Created by Kareem Kareem on 4/21/19.
//  Copyright © 2019 Kareem Kareem. All rights reserved.
//

import Foundation

enum APIResult<T, U> where U: Error {
    case success(T)
    case failure(U)
}
