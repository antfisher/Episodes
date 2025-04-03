//
//  EpisodeAppViewFactory.swift
//  EpisodesApp
//
//  Created by Anton Rybaiev on 2025-04-01.
//

import SwiftUI

class EpisodeAppViewFactory: EpisodeAppViewFactoryType {
    
    private let networkService: EpisodesNetworkServiceType
    
    init(networkService: EpisodesNetworkServiceType = EpisodesNetworkService()) {
        self.networkService = networkService
    }
    
    func buildEpisodeListView(coordinator: any CoordinatorType) -> AnyView {
        let viewModel = EpisodeListView.ViewModel(coordinator: coordinator, networkService: networkService)
        return AnyView(EpisodeListView(viewModel: viewModel))
    }
    
    func buildEpisodeDetailsView(episode: Episode) -> AnyView {
        let viewModel = EpisodeDetailsView.ViewModel(episode: episode)
        return AnyView(EpisodeDetailsView(viewModel: viewModel))
    }
}
