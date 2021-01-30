//
//  PostDataProvider.swift
//  OneLabe-Twitter
//
//  Created by admin on 12/30/20.
//

import Foundation

protocol PostDataProvider {
    func fetchPosts(success: @escaping ([Post]) -> Void, failure: @escaping (Error) -> Void)
}

final class PostNetworkDataProvider: PostDataProvider {
    func fetchPosts(success: @escaping ([Post]) -> Void, failure: @escaping (Error) -> Void) {
        let key = "DKnrVgmpo-QM3ubZeB9RBIvI6J3M5vjPPmJVv8nPLJ0"
        let urlString = "https://api.unsplash.com/photos/random/?count=30&client_id=\(key)"
//        let urlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                failure(error)
            } else if let data = data {
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    DispatchQueue.main.async {
                        success(posts)
                    }
                } catch {
                    failure(error)
                }
            }
        }.resume()
    }
}
