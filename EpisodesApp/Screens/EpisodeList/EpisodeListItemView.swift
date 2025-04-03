//
//  EpisodeListItemView.swift
//  EpisodesApp
//
//  Created by Anton Rybaiev on 2025-04-01.
//

import SwiftUI

struct EpisodeListItemView: View {
    
    let episode: Episode
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text(episode.title)
                .foregroundStyle(.primary)
            HStack {
                Image(systemName: "clock")
                Text("\(episode.formattedDuration)")
            }
            .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .overlay {
            RoundedRectangle(cornerRadius: 3)
                .stroke(.secondary, lineWidth: 1)
        }
    }
}

#Preview {
    EpisodeListItemView(episode: Episode.mokedEpisode)
}
