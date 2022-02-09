//
//  GithubResponse.swift
//  PeekTakeHome
//
//  Created by Nathan Andrus on 2/8/22.
//

import Foundation

struct GitHubResponse: Decodable {
    var data: DataDictionary?
}
struct DataDictionary: Decodable {
    var search: EdgesDictionary?
}
struct EdgesDictionary: Decodable {
    var edges: [NodeObject]?
    var pageInfo: PageInfoDictionary?
}
struct NodeObject: Decodable {
    var node: NodeDictionary?
}
struct NodeDictionary: Decodable, Equatable {
    static func == (lhs: NodeDictionary, rhs: NodeDictionary) -> Bool {
        return lhs.id == rhs.id
    }
    
    var nameWithOwner: String?
    var stargazerCount: Int?
    var description: String?
    var owner: OwnerDictionary?
    var id: String?
    
    var ownerName: String? {
        let split = nameWithOwner?.components(separatedBy: "/")
        return split?.first
    }
    var repoName: String? {
        let split = nameWithOwner?.components(separatedBy: "/")
        return split?.last
    }
    
    struct OwnerDictionary: Decodable {
        var avatarUrl: String?
        var id: String?
    }
}
struct PageInfoDictionary: Decodable {
    var endCursor: String?
    var startCursor: String?
    var hasNextPage: Bool = false
    var hasPreviousPage: Bool = false
}
