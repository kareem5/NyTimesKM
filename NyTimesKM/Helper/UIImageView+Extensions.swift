//
//  UIImageView+Extensions.swift
//  NyTimesKM
//
//  Created by Kareem Kareem on 4/22/19.
//  Copyright © 2019 Kareem Kareem. All rights reserved.
//

import UIKit

class CasheManager {
    static let shared = CasheManager()
    let imageCahser: NSCache<NSString, UIImage>
    private init() {
        self.imageCahser = NSCache<NSString, UIImage>()
    }
}

extension UIImageView {
    var imageCache: NSCache<NSString, UIImage> {
        return CasheManager.shared.imageCahser
    }
    
    
    
    func loadCachedImage(withUrl urlString: String) {
        let url = URL(string: urlString)
        self.image = nil

        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        
        // Download image from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, _, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                // Update Image on UI after fetching
                if let image = UIImage(data: data!) {
                    self.imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                }
            }
        }).resume()
    }
}
