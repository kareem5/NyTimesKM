//
//  TableCellConfigutator.swift
//  NyTimesKM
//
//  Created by Kareem Kareem on 4/21/19.
//  Copyright © 2019 Kareem Kareem. All rights reserved.
//

import UIKit

class TableCellConfigutator<CellType: ConfigurableCell, CellDataType: Hashable>: CellConfigurator where CellType.CellDataType == CellDataType, CellType: UITableViewCell {
    
    static var reuseId: String { return CellType.reuseIdentifier }
    static var rowHeight: CGFloat {
        if let height = CellType.height {
            return height
        }
        return 44
    }
    
    let item: CellDataType
    
    init(item: CellDataType) {
        self.item = item
    }
    
    func configure(cell: UIView) {
        (cell as! CellType).configure(data: item)
    }
    
}
