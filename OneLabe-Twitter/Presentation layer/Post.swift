//
//  Post.swift
//  OneLabe-Twitter
//
//  Created by admin on 12/22/20.
//

import Foundation

struct Post: Decodable {
    let id: String
    let created_at: String
    let urls: [String: String]
    let width: Int
    let height: Int
}
