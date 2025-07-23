//
//  HTTPEndpoint.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 23.07.25.
//

import Foundation

public struct HTTPEndpoint {
  // MARK: Lifecycle

  public init(path: String, queryItems: [URLQueryItem]? = nil) {
    self.path = path
    self.queryItems = queryItems
  }

  // MARK: Public

  public let path: String
  public let queryItems: [URLQueryItem]?
}
