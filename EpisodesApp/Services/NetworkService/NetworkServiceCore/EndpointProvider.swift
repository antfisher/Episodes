//
//  EndpointProvider.swift
//  EpisodesApp
//
//  Created by Anton Rybaiev on 2025-04-01.
//

import Foundation

protocol EndpointProvider {

    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var token: String? { get }
    var queryItems: [URLQueryItem]? { get }
    var body: [String: Any]? { get }
}

extension EndpointProvider {

    var scheme: String {
        return "https"
    }

    var baseURL: String {
        return ApiConfig.baseUrl
    }
    
    var body: [String: Any]? {
        return nil
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }

    func asURLRequest() throws -> URLRequest {

        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host =  baseURL
        urlComponents.path = path
        if let queryItems = queryItems {
            urlComponents.queryItems = queryItems
        }
        guard let url = urlComponents.url else {
            throw ApiError(message: "URL error")
        }

        var urlRequest = URLRequest(url: url)
        // Actually we don't need it for this project but usually we want to add some headers, including authorization
        urlRequest.httpMethod = method.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("true", forHTTPHeaderField: "X-Use-Cache")

        if !(token ?? "").isEmpty {
            urlRequest.addValue("Bearer \(token!)", forHTTPHeaderField: "Authorization")
        }
        if let body = body {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            } catch {
                throw ApiError(message: "Error encoding http body")
            }
        }
        return urlRequest
    }
}
