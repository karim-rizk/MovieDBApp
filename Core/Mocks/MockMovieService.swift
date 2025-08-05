//
//  MockMovieService.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 05.08.25.
//
import Combine
import Foundation

final class MockMovieService: MovieServiceProtocol {
  func getPopularMovies() -> AnyPublisher<[Movie], any Error> {
    guard let url = Bundle.main.url(forResource: "popular_movies", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let dto = try? JSONDecoder().decode(MovieRemoteResponseDTO.self, from: data)
    else {
      return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
    }

    return Just(dto.toDomain())
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
  }
}
