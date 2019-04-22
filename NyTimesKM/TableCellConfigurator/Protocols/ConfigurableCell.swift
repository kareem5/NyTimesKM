//
//  ConfigurableCell.swift
//  NyTimesKM
//
//  Created by Kareem Kareem on 4/21/19.
//  Copyright © 2019 Kareem Kareem. All rights reserved.
//

import UIKit

protocol ConfigurableCell {
    associatedtype CellDataType
    func configure(data: CellDataType)
    static var height: CGFloat? { get }
    static var reuseIdentifier: String { get }
}

extension ConfigurableCell {
    static var reuseIdentifier: String { return String(describing: Self.self) }
}


protocol CellConfigurator {
    static var reuseId: String { get }
    static var rowHeight: CGFloat { get }
    func configure(cell: UIView)
}
