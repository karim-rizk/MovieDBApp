//
//  RemoteMovieService.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 23.07.25.
//

import Combine
import Foundation

public final class RemoteMovieService: MovieServiceProtocol {
  // MARK: Lifecycle

  public init(httpClient: HTTPClient) {
    self.httpClient = httpClient
  }

  // MARK: Public

  public func getPopularMovies(at page: Int) -> AnyPublisher<PaginatedMovies, Error> {
    let endpoint = HTTPEndpoint(
      path: "/movie/popular",
      queryItems: [
        URLQueryItem(name: "language", value: "en-US"),
        URLQueryItem(name: "page", value: String(page)),
      ]
    )

    return httpClient
      .get(endpoint)
      .map { (dto: MovieRemoteResponseDTO) in
        PaginatedMovies(page: dto.page, totalPages: dto.totalPages, movies: dto.toDomain())
      }
      .eraseToAnyPublisher()
  }

  // MARK: Private

  private let httpClient: HTTPClient
}
