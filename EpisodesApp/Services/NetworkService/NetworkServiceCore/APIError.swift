//
//  ApiError.swift
//  EpisodesApp
//
//  Created by Anton Rybaiev on 2025-04-01.
//

import Foundation

struct ApiError: Error, Equatable {

    var statusCode: Int!
    let message: String

    init(statusCode: Int = 0, message: String) {
        self.statusCode = statusCode
        self.message = message
    }

    private enum CodingKeys: String, CodingKey {
        case message = "error"
    }
}

extension ApiError: Decodable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        message = try container.decode(String.self, forKey: .message)
        statusCode = 0
    }
}
