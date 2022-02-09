//
//  RepoRow.swift
//  PeekTakeHome
//
//  Created by Nathan Andrus on 2/8/22.
//

import SwiftUI

struct RepoRow: View {
    
    var repo: NodeDictionary
    
    var body: some View {
        HStack {
            if repo.owner?.avatarUrl != nil {
                AsyncImage(url: URL(string: repo.owner!.avatarUrl!))
                    .frame(width: 100, height: 100)
            }
            VStack(alignment: .leading) {
                Text("Owner: " + (repo.ownerName ?? "N/A"))
                    .fontWeight(.heavy)
                Text("Repo name: " + (repo.repoName ?? "N/A"))
                    .fontWeight(.bold)
                Text("Number of stargazers: \(repo.stargazerCount ?? 0)")
                    .fontWeight(.light)
                Text(repo.description ?? "No description available")
                    .fontWeight(.ultraLight)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.gray, radius: 8)
        .padding(8)
    }
}
