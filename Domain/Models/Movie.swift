//
//  Movie.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 23.07.25.
//

import Foundation

// MARK: - Movie

public struct Movie: Identifiable, Equatable {
  public let id: Int
  public let title: String
  public let overview: String
  public let posterPath: String?
  public let backdropPath: String?
  public let releaseDate: String
  public let voteAverage: Double
  public let voteCount: Int
  public let genreIDs: [Int]
}

// MARK: - PaginatedMovies

public struct PaginatedMovies {
  public let page: Int
  public let totalPages: Int
  public let movies: [Movie]
}
