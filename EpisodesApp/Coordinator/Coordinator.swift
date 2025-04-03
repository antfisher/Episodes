//
//  Coordinator.swift
//  EpisodesApp
//
//  Created by Anton Rybaiev on 2025-04-01.
//

import Foundation
import SwiftUI

class Coordinator: CoordinatorType, ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    
    private let factory: EpisodeAppViewFactoryType
    
    init(factory: EpisodeAppViewFactoryType = EpisodeAppViewFactory()) {
        self.factory = factory
    }
    
    func push(page: AppScreens) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: AppScreens) -> some View {
        switch page {
        case .episodeList:
            factory.buildEpisodeListView(coordinator: self)
        case .episodeDetails(let episode):
            factory.buildEpisodeDetailsView(episode: episode)
        }
    }
}
