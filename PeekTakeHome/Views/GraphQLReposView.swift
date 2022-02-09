//
//  GraphQLReposView.swift
//  PeekTakeHome
//
//  Created by Nathan Andrus on 2/8/22.
//

import SwiftUI

struct GraphQLReposView: View {
    
    @ObservedObject var viewModel = MainScreenVM()
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: true) {
                LazyVStack {
                    ForEach(viewModel.repos, id: \.id) { repo in
                        RepoRow(repo: repo)
                            .onAppear {
                                if viewModel.repos.last == repo {
                                    viewModel.fetchGraphQLItems()
                                }
                            }
                    }
                }
            }
            .navigationTitle("GraphQLSearches(\(viewModel.repos.count))")
        }
    }
}
