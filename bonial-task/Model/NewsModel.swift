//
//  NewsModel.swift
//  bonial-task
//
//  Created by Efe Maz on 31.07.24.
//

import Foundation

struct Article: Decodable, Identifiable {
    var id = UUID()
    let title: String
    let url: String
    let urlToImage: String?
    let content: String?
}

struct NewsResponse: Decodable {
    let articles: [Article]
}

