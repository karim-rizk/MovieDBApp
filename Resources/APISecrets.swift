//
//  APISecrets.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 20.07.25.
//

import Foundation

enum APISecrets {
  // MARK: Internal

  static var tmdbToken: String {
    guard let token = Bundle.main.object(forInfoDictionaryKey: key) as? String, token.hasPrefix("eyJ") else {
      fatalError("❌ '\(key)' is missing or invalid in Info.plist. Ensure it's injected via .xcconfig and Build Settings.")
    }

    return token
  }

  // MARK: Private

  private static let key = "TMDB_API_READ_ACCESS_TOKEN"
}
