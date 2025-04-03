//
//  EpisodesNetworkService.swift
//  EpisodesApp
//
//  Created by Anton Rybaiev on 2025-04-01.
//

import Foundation

protocol EpisodesNetworkServiceType {
    func getEppisodeList() async throws -> [Episode]
}

struct EpisodesNetworkService {
    
    enum EpisodesEndpoints: EndpointProvider {
        
        case episodeList
        
        var path: String {
            return "/v3/60be28f4-53ce-4c6b-85c6-716bcdd02942"
        }
        
        var method: RequestMethod {
            return .get
        }
        
        var token: String? {
            return nil
        }
    }
}

extension EpisodesNetworkService: EpisodesNetworkServiceType {
    
    func getEppisodeList() async throws -> [Episode] {
        try await ApiClient.shared.asyncRequest(endpoint: EpisodesEndpoints.episodeList)
    }
}
