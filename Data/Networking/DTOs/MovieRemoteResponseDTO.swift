//
//  MovieRemoteResponseDTO.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 23.07.25.
//

import Foundation

struct MovieRemoteResponseDTO: Decodable {
  enum CodingKeys: String, CodingKey {
    case page
    case results
    case totalPages = "total_pages"
    case totalResults = "total_results"
  }

  let page: Int
  let results: [MovieRemoteDTO]
  let totalPages: Int
  let totalResults: Int
}
