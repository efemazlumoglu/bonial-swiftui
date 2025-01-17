//
//  NewsViewModel.swift
//  bonial-task
//
//  Created by Efe Maz on 31.07.24.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles = [Article]()
    private var page = 1
    private let pageSize = 21
    private let session: URLSession
    private var isLoading = false
    
    private var apiKey: String {
        return Bundle.main.infoDictionary?["APIKey"] as? String ?? ""
    }

    init(session: URLSession = .shared) {
        self.session = session
        loadNews()
    }

    func loadNews() {
        guard !isLoading else { return }
        isLoading = true
        guard let url = Constants.topHeadlinesURL(page: page, pageSize: pageSize, apiKey: apiKey) else { return }
        session.dataTask(with: url) { data, response, error in
            self.isLoading = false
            guard let data = data, error == nil else { return }

            do {
                let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                DispatchQueue.main.async {
                    self.articles.append(contentsOf: newsResponse.articles)
                    self.page += 1
                }
            } catch {
                print("Failed to decode JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}

