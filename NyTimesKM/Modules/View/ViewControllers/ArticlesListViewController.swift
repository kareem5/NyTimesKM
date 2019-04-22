//
//  ViewController.swift
//  NyTimesKM
//
//  Created by Kareem Kareem on 4/21/19.
//  Copyright © 2019 Kareem Kareem. All rights reserved.
//

import UIKit


class ArticlesListViewController: UIViewController {

    let viewModel = ArticlesListViewModel()
    let actionsProxy = TableCellActionProxy()
    let detailsSegue = "details_segue"
    
    @IBOutlet weak var articlesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "NY Times Most Popular" 
        self.articlesTableView.register(ArticleTableViewCell.nib, forCellReuseIdentifier: ArticleTableViewCell.identifier)
        
        self.articlesTableView.dataSource = self
        self.articlesTableView.delegate = self
        
        viewModel.articlesBind = {
            self.articlesTableView.reloadData()
        }
        
        setupListeners()
    }
    
    func setupListeners() {
        
        actionsProxy.on(action: .didSelect) { (configurator: KeyArticleCellConfig, cell) in
            self.performSegue(withIdentifier: self.detailsSegue, sender: configurator.item)
        }
    }
    
}

extension ArticlesListViewController: UITableViewDataSource, UITableViewDelegate {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let articleItem = viewModel.article(at: indexPath)
    let cell = tableView.dequeueReusableCell(withIdentifier: type(of: articleItem).reuseId, for: indexPath)
    articleItem.configure(cell: cell)
    return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let articleItem = viewModel.article(at: indexPath)
    let cellType = type(of: articleItem)
    return cellType.rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let configurator = viewModel.article(at: indexPath)
    guard let cell = tableView.cellForRow(at: indexPath) else { return }
    self.actionsProxy.invoke(action: .didSelect, cell: cell, configurator: configurator)
    }
}


extension ArticlesListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let articleDetailsVC = segue.destination as? ArticleDetailsViewController {
            guard let article = sender as? Article  else { return }
            let vm = viewModel.articleDetailsViewModel(article: article)
            articleDetailsVC.viewModel = vm
        }
    }
}
