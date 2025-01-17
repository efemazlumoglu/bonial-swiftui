//
//  NewsModel.swift
//  bonial-task
//
//  Created by Efe Maz on 31.07.24.
//

import Foundation

// MARK: - API Response
struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Equatable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
    static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.url == rhs.url
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}


