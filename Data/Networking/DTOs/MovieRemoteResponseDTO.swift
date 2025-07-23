//
//  MovieRemoteResponseDTO.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 23.07.25.
//

import Foundation

public struct MovieRemoteResponseDTO: Decodable {
  // MARK: Public

  public let page: Int
  public let results: [MovieRemoteDTO]
  public let totalPages: Int
  public let totalResults: Int

  // MARK: Internal

  enum CodingKeys: String, CodingKey {
    case page
    case results
    case totalPages = "total_pages"
    case totalResults = "total_results"
  }
}
