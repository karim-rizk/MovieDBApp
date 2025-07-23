//
//  URLSessionHTTPClient.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 23.07.25.
//

import Combine
import Foundation

// MARK: - URLSessionHTTPClient

public final class URLSessionHTTPClient: HTTPClient {
  // MARK: Lifecycle

  public init(session: URLSession = .shared, baseURL: URL, accessToken: String) {
    self.session = session
    self.baseURL = baseURL
    self.accessToken = accessToken
  }

  // MARK: Public

  public func get<T: Decodable>(_ endpoint: HTTPEndpoint) -> AnyPublisher<T, Error> {
    var components = URLComponents(
      url: baseURL.appendingPathComponent(endpoint.path),
      resolvingAgainstBaseURL: false
    )!
    components.queryItems = endpoint.queryItems

    guard let url = components.url else {
      return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
    }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "Accept")

    return session.dataTaskPublisher(for: request)
      .tryMap { data, response in
        guard let httpResponse = response as? HTTPURLResponse else {
          throw URLError(.badServerResponse)
        }
        guard (200 ... 299).contains(httpResponse.statusCode) else {
          throw HTTPClientError.statusCode(httpResponse.statusCode, data: data)
        }

        return data
      }
      .decode(type: T.self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }

  // MARK: Private

  private let session: URLSession
  private let baseURL: URL
  private let accessToken: String
}
