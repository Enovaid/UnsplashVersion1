//
//  PostsLocalStorage.swift
//  OneLabe-Twitter
//
//  Created by admin on 12/30/20.
//

import Foundation

protocol PostsLocalStorage {
    func save(posts: [Post])
    func obtainPost() -> [Post]
}

final class PostsLocalStorageImpl: PostsLocalStorage {
    func save(posts: [Post]) {
        // todo: save posts
    }

    func obtainPost() -> [Post] {
        // todo: obtain posts
        return []
    }
}
