//
//  MovieDBAPI.swift
//  CombineDemo
//
//  Created by James Folk on 5/20/22.
//

import Foundation
import Combine

// 1
enum MovieDB {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://api.themoviedb.org/3/")!
    static let imageBaseUrl = URL(string: "http://image.tmdb.org/t/p/w500")!
}

// 2
enum APIPath: String {
    case trendingMoviesWeekly = "trending/movie/week"
}

extension MovieDB {
    
    static func request(_ path: APIPath) -> AnyPublisher<MovieResponse, Error> {
        // 3
        guard var components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
        components.queryItems = [URLQueryItem(name: "api_key", value: "789a3ad9fb130b33628be0e27eaf57c8")] // 4
        
        let request = URLRequest(url: components.url!)
        
        return apiClient.run(request) // 5
            .map(\.value) // 6
            .eraseToAnyPublisher() // 7
    }
}
