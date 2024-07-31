//
//  NewListViewTests.swift
//  bonial-taskTests
//
//  Created by Efe Maz on 31.07.24.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import bonial_task // Replace with your app's module name

extension NewsListView: Inspectable {}

class NewsListViewTests: XCTestCase {
    var viewModel: NewsViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = NewsViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testNewsListViewRendersCorrectly() throws {
        // Given
        let article = Article(
            source: Source(id: "1", name: "Source1"),
            author: "Author1",
            title: "Title1",
            description: "Description1",
            url: "https://example.com/1",
            urlToImage: nil,
            publishedAt: "2024-07-31T00:00:00Z",
            content: "Content1"
        )
        viewModel.articles = [article]
        
        // When
        let view = NewsListView(viewModel: viewModel)
        let inspectedView = try view.inspect().find(text: "Title1")
        
        // Then
        let titleText = inspectedView
        XCTAssertEqual(try titleText.string(), "Title1")
    }
}

