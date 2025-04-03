//
//  EpisodeListViewModel.swift
//  EpisodesApp
//
//  Created by Anton Rybaiev on 2025-04-01.
//

import Foundation

extension EpisodeListView {
    
    class ViewModel: ObservableObject {
        
        // MARK: Public properties
        
        @Published var episodes: [Episode] = []
        @Published var isLoading: Bool = false
        @Published var error: ApiError? = nil
        
        // MARK: Private properties
        
        private weak var coordinator: CoordinatorType?
        private let networkService: EpisodesNetworkServiceType
        
        // MARK: Lifecycle
        
        init(coordinator: CoordinatorType, networkService: EpisodesNetworkServiceType) {
            self.coordinator = coordinator
            self.networkService = networkService
    
            getEpisodes()
        }
        
        // MARK: - Public methods
        
        func getEpisodes() {
            Task { @MainActor [weak self] in
                guard let self else { return }
                do {
                    self.isLoading = true
                    self.episodes = try await self.networkService.getEppisodeList()
                    self.error = nil
                } catch let error as ApiError {
                    self.error = error
                } catch {
                    self.error = ApiError(message: error.localizedDescription)
                }
                self.isLoading = false
            }
        }
        
        func showDetails(_ episode: Episode) {
            coordinator?.push(page: .episodeDetails(episode: episode))
        }
    }
}
