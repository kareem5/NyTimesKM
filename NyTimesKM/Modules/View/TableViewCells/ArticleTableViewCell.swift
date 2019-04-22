//
//  ArticleTableViewCell.swift
//  NyTimesKM
//
//  Created by Kareem Kareem on 4/21/19.
//  Copyright © 2019 Kareem Kareem. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell, ConfigurableCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var abstractLabel: UILabel!
    @IBOutlet private weak var bylineLabel: VerticalAlignedLabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var articleImageView: UIImageView!

    
    static var height: CGFloat? { return 98 }
    
    var article: Article?
    
    func configure(data article: Article) {
        titleLabel.text = article.title
        bylineLabel.text = article.byline
        dateLabel.text = article.publishedDate
        if let imageUrl = article.thumbnailURL {
            articleImageView.loadCachedImage(withUrl: imageUrl)
        }
        self.article = article
        self.selectionStyle = .none
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        bylineLabel.contentMode = .bottom
    }
}
