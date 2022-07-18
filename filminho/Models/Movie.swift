//
//  Movie.swift
//  filminho
//
//  Created by michellyes on 12/07/22.
//

import Foundation

struct Movie: Codable {
    let title: String
    let poster: String
    let backdrop: String
    let voteAverage: Float
    let releaseDate: String
    let overview: String
    let genres: [String]?
}

