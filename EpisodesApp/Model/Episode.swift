//
//  Episode.swift
//  EpisodesApp
//
//  Created by Anton Rybaiev on 2025-04-01.
//

import Foundation

struct Episode: Hashable, Identifiable {
    
    let id: String
    let title: String
    let description: String?
    let videoUrl: URL
    let duration: TimeInterval
    
    internal init(
        id: String,
        title: String,
        description: String? = nil,
        videoUrl: URL,
        duration: TimeInterval
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.videoUrl = videoUrl
        self.duration = duration
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case videoUrl
        case duration
    }
}

extension Episode: Decodable {
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        
        let urlString = try container.decode(String.self, forKey: .videoUrl)
        guard let videoUrl = URL(string: urlString) else {
            throw ApiError(message: "Can't decode video URL")
        }
        self.videoUrl = videoUrl
        self.duration = try container.decode(TimeInterval.self, forKey: .duration)
    }
}

extension Episode {
    var formattedDuration: String {
        let duration = Duration.seconds(duration)
        return duration.formatted(
            .time(pattern: .minuteSecond))
    }
}

extension Episode {
    static let mokedEpisode = Episode(
        id: "1",
        title: "Episode 1",
        description: "Episode 1 description",
        videoUrl: URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!,
        duration: 120
    )
    static let mokedEpisode1 = Episode(
        id: "1",
        title: "Episode 1",
        description: nil,
        videoUrl: URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!,
        duration: 120
    )
}
