//
//  EpisodeDetailsViewModel.swift
//  EpisodesApp
//
//  Created by Anton Rybaiev on 2025-04-01.
//

import Foundation
import AVKit
import Combine

extension EpisodeDetailsView {
    
    class ViewModel: ObservableObject {
        
        // MARK: Public properties
        
        @Published var isLoadingVideo: Bool = false
        
        let episode: Episode
        let player = AVPlayer()
        
        // MARK: Private properties
        
        private var cancellable: Cancellable?
        
        // MARK: Lifecycle
        
        init(episode: Episode) {
            self.episode = episode
            
            cancellable = player.publisher(for: \.timeControlStatus)
                .removeDuplicates()
                .sink { [weak self] status in
                    self?.isLoadingVideo = status == .waitingToPlayAtSpecifiedRate
                }
        }
        
        // MARK: - Public methods
        
        func play() {
            player.play()
        }
        
        func pause() {
            player.pause()
        }
    }
}
