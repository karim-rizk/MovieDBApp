//
//  MockMovieService.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 05.08.25.
//
import Combine
import Foundation

// MARK: - MockMovieService

final class MockMovieService: MovieServiceProtocol {
  // MARK: Internal

  func getPopularMovies(at _: Int) -> AnyPublisher<PaginatedMovies, any Error> {
    guard let dto = Self.loadPopularMoviesFromBundle() else {
      return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
    }

    return Just(
      PaginatedMovies(page: dto.page, totalPages: dto.totalPages, movies: dto.toDomain()))
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
  }

  // MARK: Private

  private static func loadPopularMoviesFromBundle() -> MovieRemoteResponseDTO? {
    guard let url = Bundle.main.url(forResource: "popular_movies", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let dto = try? JSONDecoder().decode(MovieRemoteResponseDTO.self, from: data)
    else {
      return nil
    }

    return dto
  }
}

#if DEBUG
  extension MockMovieService {
    /// Synchronously load movies from the bundled mock JSON, for use in SwiftUI previews.
    func loadPreviewMovies() -> [Movie] {
      Self.loadPopularMoviesFromBundle()?.toDomain() ?? []
    }
  }
#endif
