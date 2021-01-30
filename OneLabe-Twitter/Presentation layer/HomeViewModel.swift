//
//  HomeViewModel.swift
//  OneLabe-Twitter
//
//  Created by admin on 12/30/20.
//

import Foundation

final class HomeViewModel {
    var didStartRequest: () -> Void = { }
    var didEndRequest: () -> Void = { }
    var didGetError: (Error) -> Void = { _ in }
    private(set) var posts: [Post] = []
    private let postService: PostService = PostServiceImpl()
    private let authService: AuthService = AuthServiceImpl()

    func fetchPosts() {
        didStartRequest()
        postService.fetchPosts { [weak self] posts in
            self?.posts = posts
            self?.didEndRequest()
        } failure: { [weak self] error in
            self?.didGetError(error)
        }
    }

    func updatePostLikeCount(id: String) {
        postService.updatePost(by: id)
    }

    func logout() {
        authService.logout()
    }
}
