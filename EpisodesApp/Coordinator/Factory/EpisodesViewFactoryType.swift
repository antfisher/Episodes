//
//  EpisodeAppViewFactoryType.swift
//  EpisodesApp
//
//  Created by Anton Rybaiev on 2025-04-01.
//

import SwiftUI

protocol EpisodeAppViewFactoryType {
    
    func buildEpisodeListView(coordinator: CoordinatorType) -> AnyView
    func buildEpisodeDetailsView(episode: Episode) -> AnyView
}
