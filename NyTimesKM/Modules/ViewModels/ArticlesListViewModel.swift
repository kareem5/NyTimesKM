//
//  ArticlesListViewModel.swift
//  NyTimesKM
//
//  Created by Kareem Kareem on 4/21/19.
//  Copyright © 2019 Kareem Kareem. All rights reserved.
//

import Foundation

typealias KeyArticleCellConfig = TableCellConfigutator<ArticleTableViewCell, Article>

class ArticlesListViewModel {
    
    let apiClient = ArticlesClient()
    var articles = [CellConfigurator]()
    
    var articlesBind: (() -> ())?
    
    //MARK:- Init
    init() {
        fetchArticles()
    }
    
    //MARK:- Api
    func fetchArticles() {
        apiClient.getFeeds(from: .day) { (result) in
            switch result {
            case .success(let artcilesResult):
                guard let articles = artcilesResult.results else { return }
                //                print("articles: \(articles)")
                self.fillArticles(result: articles)
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
    private func fillArticles(result: [Article]) {
        for article in result {
            articles.append(KeyArticleCellConfig(item: article))
        }
        if let articlesBind = articlesBind {
            articlesBind()
        }
    }
    
    
    //MARK:- TableView DataSource
    func numberOfRows() -> Int {
        return articles.count
    }
    
    func article(at indexPath: IndexPath) -> CellConfigurator {
        return articles[indexPath.row]
    }
    
    
    //MARK:- ArticleDetailsViewModel
    func articleDetailsViewModel(article: Article) -> ArticleDetailsViewModel {
        let articalDetailsVM = ArticleDetailsViewModel(article: article)
        return articalDetailsVM
    }
}
