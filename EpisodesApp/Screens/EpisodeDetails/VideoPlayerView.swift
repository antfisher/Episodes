//
//  VideoPlayerView.swift
//  EpisodesApp
//
//  Created by Anton Rybaiev on 2025-04-01.
//

import AVFoundation
import AVKit
import SwiftUI

struct VideoPlayerView: UIViewControllerRepresentable {
    
    // MARK: Public properties
    
    private let videoURL: URL
    private let avPlayer: AVPlayer
    
    // MARK: Lifecycle
    
    init(videoURL: URL, avPlayer: AVPlayer) {
        self.videoURL = videoURL
        self.avPlayer = avPlayer
    }
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        avPlayer.replaceCurrentItem(with: AVPlayerItem(url: videoURL))
        controller.player = avPlayer
        controller.showsPlaybackControls = true
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
        } catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}
