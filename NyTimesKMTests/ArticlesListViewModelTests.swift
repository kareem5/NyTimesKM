//
//  ArticlesListViewModelTests.swift
//  NyTimesKMTests
//
//  Created by Kareem Kareem on 4/22/19.
//  Copyright © 2019 Kareem Kareem. All rights reserved.
//

import XCTest
@testable import NyTimesKM

class ArticlesListViewModelTests: XCTestCase {

    var viewModel: ArticlesListViewModel!
    override func setUp() {
        viewModel = ArticlesListViewModel()
        viewModel.articlesBind = {
        }
    }

    override func tearDown() {
        viewModel = nil
    }

    func testFetchingDataFromApi() {
        // When
        viewModel.fetchArticles()
        let delayExpectation = expectation(description: "Waiting for fetching")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            delayExpectation.fulfill()
        }
        waitForExpectations(timeout: 5)
        
        // Then
        XCTAssertGreaterThan(viewModel.numberOfRows(), 1)
    }

}
