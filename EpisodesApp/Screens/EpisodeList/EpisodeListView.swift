//
//  EpisodeListView.swift
//  EpisodesApp
//
//  Created by Anton Rybaiev on 2025-04-01.
//

import SwiftUI

struct EpisodeListView: View {
    
    @StateObject var viewModel: ViewModel
    @State var showAlert = false
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                contentView
            }
        }
        .navigationTitle("Episodes")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: viewModel.error) { _, newValue in
            showAlert = newValue != nil
        }
        .alert(viewModel.error?.message ?? "", isPresented: $showAlert) {
            Button("OK") {
                showAlert = false
                viewModel.error = nil
            }
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        if viewModel.episodes.isEmpty {
            emptyView
        } else {
            listView
        }
    }
    
    @ViewBuilder
    var listView: some View {
        List($viewModel.episodes) { episode in
            EpisodeListItemView(episode: episode.wrappedValue)
                .contentShape(Rectangle())
                .onTapGesture {
                    viewModel.showDetails(episode.wrappedValue)
                }
                .listRowSeparator(.hidden)
                
        }
        .listStyle(.plain)
        .refreshable {
            viewModel.getEpisodes()
        }
    }
    
    @ViewBuilder
    var emptyView: some View {
        VStack {
            Text("No episodes found")
            Text("Try again later")
            Button("Retry") {
                viewModel.getEpisodes()
            }
            .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
            .foregroundStyle(.white)
            .background(.blue)
            .cornerRadius(5)
        }
    }
}

#Preview {
    EpisodeListView(viewModel: .init(coordinator: Coordinator(), networkService: EpisodesNetworkService()))
}
