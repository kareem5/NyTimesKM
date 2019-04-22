//
//  CellAction.swift
//  NyTimesKM
//
//  Created by Kareem Kareem on 4/21/19.
//  Copyright © 2019 Kareem Kareem. All rights reserved.
//

import Foundation

enum CellAction: Hashable {
    
    case didSelect
    case willDisplay
    
    var hashValue: Int {
        switch self {
        case .didSelect:
            return 0
        case .willDisplay:
            return 1
        }
    }
    
    static func ==(lhs: CellAction, rhs: CellAction) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
