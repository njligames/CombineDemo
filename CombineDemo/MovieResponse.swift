//
//  MovieResponse.swift
//  CombineDemo
//
//  Created by James Folk on 5/20/22.
//

import Foundation

struct MovieResponse: Codable {
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}
