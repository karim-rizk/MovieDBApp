//
//  HTTPClient.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 22.07.25.
//

import Combine
import Foundation

public protocol HTTPClient {
  func get<T: Decodable>(_ endpoint: HTTPEndpoint) -> AnyPublisher<T, Error>
}
