//
//  ArticleDetailView.swift
//  bonial-task
//
//  Created by Efe Maz on 31.07.24.
//

import SwiftUI
struct ArticleDetailView: View {
    var article: Article?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let urlToImage = article?.urlToImage, let url = URL(string: urlToImage) {
                    AsyncImage(url: url) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                        } else if phase.error != nil {
                            Text("Failed to load image")
                                .foregroundColor(.red)
                        } else {
                            Image("noImagePlaceholder").resizable()
                        }
                    }
                    .frame(maxHeight: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    Image("noImagePlaceholder").resizable()
                        .frame(maxHeight: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                Text(article?.title ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("By \(article?.author ?? "Unknown")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(article?.publishedAt.formatToRelativeTime() ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Divider()
                
                Text(article?.content ?? "No content available.")
                    .font(.body)
                
                if let url = URL(string: article?.url ?? "") {
                    Link("Read full article", destination: url)
                        .font(.body)
                        .foregroundColor(.blue)
                }
            }
            .padding()
        }
        .navigationTitle("Article Detail")
    }
}
