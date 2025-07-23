//
//  MovieRemoteDTO.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 23.07.25.
//

import Foundation

public struct MovieRemoteDTO: Decodable, Identifiable {
  // MARK: Public

  public let id: Int
  public let title: String
  public let overview: String
  public let posterPath: String?
  public let backdropPath: String?
  public let releaseDate: String
  public let voteAverage: Double
  public let voteCount: Int
  public let popularity: Double
  public let adult: Bool
  public let genreIDs: [Int]
  public let originalTitle: String
  public let originalLanguage: String

  // MARK: Internal

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
}
