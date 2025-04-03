//
//  EpisodeDetailsView.swift
//  EpisodesApp
//
//  Created by Anton Rybaiev on 2025-04-01.
//

import SwiftUI

struct EpisodeDetailsView: View {
    
    @StateObject var viewModel: ViewModel
    @State var notPlayed: Bool = true
    
    var body: some View {
        VStack(spacing: 20) {
            videoPlayer
            episodeInfo
            Spacer()
        }
        .padding()
        .navigationTitle(viewModel.episode.title)
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            viewModel.pause()
        }
    }
    
    @ViewBuilder
    var videoPlayer: some View {
        ZStack {
            VideoPlayerView(
                videoURL: viewModel.episode.videoUrl,
                avPlayer: viewModel.player
            )
            .frame(height: 250)
            .overlay {
                RoundedRectangle(cornerRadius: 3)
                    .stroke(.secondary, lineWidth: 1)
            }
            .overlay {
                if notPlayed && !viewModel.isLoadingVideo {
                    Button {
                        viewModel.play()
                        notPlayed = false
                    } label: {
                        Image(systemName: "play.fill")
                            .foregroundStyle(.white)
                            .font(.system(size: 50))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                
                if viewModel.isLoadingVideo {
                    ProgressView().foregroundStyle(.white)
                }
            }
        }
    }
    
    @ViewBuilder
    var episodeInfo: some View {
        VStack {
            let description = viewModel.episode.description ?? "No description available"
            Text(try! AttributedString(markdown: "**Description:** \(description)"))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(try! AttributedString(markdown: "**Duration:** \(viewModel.episode.formattedDuration)"))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    EpisodeDetailsView(viewModel: .init(episode: Episode.mokedEpisode1))
}
