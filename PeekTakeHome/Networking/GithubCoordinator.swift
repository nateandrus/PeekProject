//
//  GithubCoordinator.swift
//  PeekTakeHome
//
//  Created by Nathan Andrus on 2/8/22.
//

import Foundation

class GithubCoordinator {
    
    var endCursor: String?
    
    func fetchGraphQLItems(completion: @escaping (GitHubResponse?) -> Void) {
        var parameters = [String: Any]()
        if let cursor = endCursor {
            parameters = ["query": "{search(query: \"graphql\" type: REPOSITORY first: 20 after: \"\(cursor)\") { edges { node { ... on Repository { nameWithOwner stargazerCount description id owner { avatarUrl(size: 100) id } } } } pageInfo { endCursor startCursor hasNextPage hasPreviousPage } } }"] as [String: Any]

        } else {
            parameters = ["query": "{search(query: \"graphql\" type: REPOSITORY first: 20) { edges { node { ... on Repository { nameWithOwner stargazerCount description id owner { avatarUrl(size: 100) id } } } } pageInfo { endCursor startCursor hasNextPage hasPreviousPage } } }"] as [String: Any]
        }
        let postData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        guard let url = URL(string: "https://api.github.com/graphql") else { completion(nil); return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("bearer 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", forHTTPHeaderField: "Authorization")
        request.httpBody = postData
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription); completion(nil)
            }
            if let data = data {
                let jsonDecoder = JSONDecoder()
                guard let githubResponse = try? jsonDecoder.decode(GitHubResponse.self, from: data) else { completion(nil); return }
                if let endCursor = githubResponse.data?.search?.pageInfo?.endCursor {
                    self.endCursor = endCursor
                }
                completion(githubResponse)
            }
        }
        dataTask.resume()
    }
}
