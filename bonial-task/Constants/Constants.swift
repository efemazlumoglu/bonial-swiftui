//
//  Constants.swift
//  bonial-task
//
//  Created by Efe Maz on 31.07.24.
//

import Foundation

struct Constants {
    static let baseURL = "https://newsapi.org/v2/"
    
    static func topHeadlinesURL(page: Int, pageSize: Int, apiKey: String) -> URL? {
        let endpoint = "top-headlines"
        return URL(string: "\(baseURL)\(endpoint)?country=us&pageSize=\(pageSize)&page=\(page)&apiKey=\(apiKey)")
    }
}
