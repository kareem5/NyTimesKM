//
//  ArticleDetailsViewController.swift
//  NyTimesKM
//
//  Created by Kareem Kareem on 4/22/19.
//  Copyright © 2019 Kareem Kareem. All rights reserved.
//

import UIKit

class ArticleDetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var bylineLabel: VerticalAlignedLabel!
    @IBOutlet weak var dateLabel: UILabel!
    var viewModel: ArticleDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadArticleDetails()
    }
    
    func loadArticleDetails() {
        if let viewModel = viewModel {
            titleLabel.text = viewModel.articleTitle
            bylineLabel.text = viewModel.articleByline
            dateLabel.text = viewModel.publishedDate
            abstractLabel.text = viewModel.articleAbstract
            
            if let imageUrl = viewModel.articleImageUrl {
                articleImageView.loadCachedImage(withUrl: imageUrl)
            }
        }
    }

}
