//
//  MovieServiceProtocol.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 31.07.25.
//

import Combine
import Foundation

public protocol MovieServiceProtocol {
  func getPopularMovies(at page: Int) -> AnyPublisher<PaginatedMovies, Error>
}
