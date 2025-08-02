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

  public func getPopularMovies() -> AnyPublisher<[Movie], Error> {
    let endpoint = HTTPEndpoint(
      path: "/movie/popular",
      queryItems: [
        URLQueryItem(name: "language", value: "en-US"),
        URLQueryItem(name: "page", value: "1"),
      ]
    )

    return httpClient
      .get(endpoint)
      .map { (dto: MovieRemoteResponseDTO) in
        dto.toDomain()
      }
      .eraseToAnyPublisher()
  }

  // MARK: Private

  private let httpClient: HTTPClient
}
