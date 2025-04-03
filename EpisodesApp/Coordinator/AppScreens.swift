//
//  AppScreens.swift
//  EpisodesApp
//
//  Created by Anton Rybaiev on 2025-04-01.
//

import Foundation

enum AppScreens: Hashable {
    
    case episodeList
    case episodeDetails(episode: Episode)
}

extension AppScreens: Equatable {
    
    static func == (lhs: AppScreens, rhs: AppScreens) -> Bool {
        switch (lhs, rhs) {
        case (.episodeList, .episodeList):
            return true
        case (.episodeDetails(let l), .episodeDetails(let r)):
            return l == r
        default:
            return false
        }
    }
}
