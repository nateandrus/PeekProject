//
//  MainScreenVM.swift
//  PeekTakeHome
//
//  Created by Nathan Andrus on 2/8/22.
//

import Foundation

class MainScreenVM: ObservableObject {
    
    @Published var repos: [NodeDictionary] = []
    lazy var githubCoordinator = GithubCoordinator()
    
    init() {
        fetchGraphQLItems()
    }
    
    func fetchGraphQLItems() {
        githubCoordinator.fetchGraphQLItems { githubResponse in
            guard let response = githubResponse else { return }
            DispatchQueue.main.async {
                if let nodes = response.data?.search?.edges {
                    let repos = nodes.compactMap({ $0.node })
                    self.repos.append(contentsOf: repos)
                }
            }
        }
    }
}
