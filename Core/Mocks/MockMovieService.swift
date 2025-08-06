//
//  MockMovieService.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 05.08.25.
//
import Combine
import Foundation

final class MockMovieService: MovieServiceProtocol {
  func getPopularMovies(at _: Int) -> AnyPublisher<PaginatedMovies, any Error> {
    guard let url = Bundle.main.url(forResource: "popular_movies", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let dto = try? JSONDecoder().decode(MovieRemoteResponseDTO.self, from: data)
    else {
      return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
    }

    return Just(
      PaginatedMovies(page: dto.page, totalPages: dto.totalPages, movies: dto.toDomain()))
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
  }
}
