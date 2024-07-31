//
//  bonial_taskTests.swift
//  bonial-taskTests
//
//  Created by Efe Maz on 31.07.24.
//

import XCTest
@testable import bonial_task

final class bonial_taskTests: XCTestCase {
    
    var viewModel: NewsViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = NewsViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testInitialState() {
        XCTAssertEqual(viewModel.articles.count, 0)
    }
    
    func testLoadNewsSuccess() {
        // Mock the network response
        let mockArticles = [
            Article(source: Source(id: "1", name: "Source1"), author: "Author1", title: "Title1", description: "Description1", url: "https://example.com/1", urlToImage: nil, publishedAt: "2024-07-31T00:00:00Z", content: "Content1"),
            Article(source: Source(id: "2", name: "Source2"), author: "Author2", title: "Title2", description: "Description2", url: "https://example.com/2", urlToImage: nil, publishedAt: "2024-07-31T00:00:00Z", content: "Content2")
        ]
        
        viewModel.articles = mockArticles
        
        XCTAssertEqual(viewModel.articles.count, 2)
        XCTAssertEqual(viewModel.articles.first?.title, "Title1")
        XCTAssertEqual(viewModel.articles.last?.title, "Title2")
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
