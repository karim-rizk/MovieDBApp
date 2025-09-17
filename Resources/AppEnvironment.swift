//
//  AppEnvironment.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 20.07.25.
//

import Foundation

enum AppEnvironment {
  // MARK: Internal

  static let baseURL: URL = .init(string: "https://api.themoviedb.org/3")!
  static let imageBaseURL: URL = .init(string: "https://image.tmdb.org/t/p")!
  static let posterSize = "w500"
  static let backdropSize = "w780"

  static var tmdbToken: String {
    guard let token = Bundle.main.object(forInfoDictionaryKey: key) as? String, token.hasPrefix("eyJ") else {
      fatalError("❌ '\(key)' is missing or invalid in Info.plist. Ensure it's injected via .xcconfig and Build Settings.")
    }

    return token
  }

  // MARK: Private

  private static let key = "TMDB_API_READ_ACCESS_TOKEN"
}
