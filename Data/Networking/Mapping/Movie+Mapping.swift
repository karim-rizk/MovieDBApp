//
//  Movie+Mapping.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 23.07.25.
//

import Foundation

extension MovieRemoteDTO {
  func toDomain() -> Movie {
    Movie(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
      backdropPath: backdropPath,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      voteCount: voteCount,
      genreIDs: genreIDs
    )
  }
}

extension MovieRemoteResponseDTO {
  func toDomain() -> [Movie] {
    results.map { $0.toDomain() }
  }
}
