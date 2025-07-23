//
//  HTTPClientError.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 23.07.25.
//

import Foundation

public enum HTTPClientError: Error {
  case statusCode(Int, data: Data)
}
