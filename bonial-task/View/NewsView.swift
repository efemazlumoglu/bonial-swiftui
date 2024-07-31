//
//  NewsView.swift
//  bonial-task
//
//  Created by Efe Maz on 31.07.24.
//

import SwiftUI

struct NewsListView: View {
    @ObservedObject var viewModel: NewsViewModel
    @State private var selectedArticle: Article?
    @State private var isDetailViewPresented = false
    
    var body: some View {
        GeometryReader { geometry in
            let isPortrait = geometry.size.width < geometry.size.height
            let columns = [
                GridItem(.flexible()), // First column
                      GridItem(.flexible()), // Second column for portrait mode items
                      isPortrait ? nil : GridItem(.flexible()) // Third column for landscape mode items
            ].compactMap { $0 }
            NavigationStack {
                ScrollView {
                    VStack {
                        if let firstArticle = viewModel.articles.first {
                            VStack(alignment: .leading) {
                                if let urlToImage = firstArticle.urlToImage, let url = URL(string: urlToImage) {
                                    AsyncImage(url: url) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(maxHeight: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                                Text(firstArticle.title)
                                    .font(.headline)
                                    .lineLimit(3)
                                Text(firstArticle.content ?? "")
                                    .font(.subheadline)
                                    .lineLimit(4)
                                Text(firstArticle.author ?? "")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text(firstArticle.publishedAt.formatToRelativeTime())
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            .padding()
                            .onTapGesture {
                                selectedArticle = firstArticle
                                isDetailViewPresented = true
                            }
                        }
                        if viewModel.articles.count > 1 {
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(viewModel.articles.dropFirst(), id: \.title) { article in
                                    VStack(alignment: .leading) {
                                        if let urlToImage = article.urlToImage, let url = URL(string: urlToImage) {
                                            AsyncImage(url: url) { image in
                                                image.resizable()
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            .frame(maxHeight: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        }
                                        Text(article.title)
                                            .font(.headline)
                                            .lineLimit(3)
                                        Text(article.content ?? "")
                                            .font(.subheadline)
                                            .lineLimit(4)
                                        Text(article.author ?? "")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                        Text(article.publishedAt.formatToRelativeTime())
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                    .padding([.leading, .trailing], 8)
                                    .onTapGesture {
                                        selectedArticle = article
                                        isDetailViewPresented = true
                                    }
                                    .onAppear {
                                        if article == viewModel.articles.last {
                                            viewModel.loadNews()
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 8)
                        }
                    }
                    .navigationTitle("News")
                    NavigationLink(
                        destination: ArticleDetailView(article: selectedArticle),
                        isActive: $isDetailViewPresented
                    ) {
                        EmptyView()
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        NewsListView(viewModel: NewsViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
