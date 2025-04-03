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


// Data used in this project, to easy recreate mock on Mocky (https://designer.mocky.io/) service if needed
//[
//  {
//    "id": "1",
//    "title": "Big Buck Bunny",
//    "description": "This is the first sample video.",
//    "videoUrl": "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
//    "duration": 596
//  },
//  {
//    "id": "2",
//    "title": "Elephants Dream",
//    "videoUrl": "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
//    "duration": 653
//  },
//  {
//    "id": "3",
//    "title": "For Bigger Fun",
//    "description": "This is the third sample video.",
//    "videoUrl": "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
//    "duration": 60
//  }
//]
