//
//  VerticalAlignedLabel.swift
//  NyTimesKM
//
//  Created by Kareem Kareem on 4/22/19.
//  Copyright © 2019 Kareem Kareem. All rights reserved.
//

import UIKit

class VerticalAlignedLabel: UILabel {
    
    override func drawText(in rect: CGRect) {
        var newRect = rect
        switch contentMode {
        case .top:
            newRect.size.height = sizeThatFits(rect.size).height
        case .bottom:
            let height = sizeThatFits(rect.size).height
            newRect.origin.y += rect.size.height - height
            newRect.size.height = height
        default:
            ()
        }
        
        super.drawText(in: newRect)
    }
}
