//
//  MovieRemoteDTO.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 23.07.25.
//

import Foundation

struct MovieRemoteDTO: Decodable, Identifiable {
  enum CodingKeys: String, CodingKey {
    case id
    case title
    case overview
    case posterPath = "poster_path"
    case backdropPath = "backdrop_path"
    case releaseDate = "release_date"
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
    case popularity
    case adult
    case genreIDs = "genre_ids"
    case originalTitle = "original_title"
    case originalLanguage = "original_language"
  }

  let id: Int
  let title: String
  let overview: String
  let posterPath: String?
  let backdropPath: String?
  let releaseDate: String
  let voteAverage: Double
  let voteCount: Int
  let popularity: Double
  let adult: Bool
  let genreIDs: [Int]
  let originalTitle: String
  let originalLanguage: String
}
