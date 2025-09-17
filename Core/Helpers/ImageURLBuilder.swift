//
//  ImageURLBuilder.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 13.09.25.
//

import Foundation

enum ImageURLBuilder {
  // MARK: Internal

  static func poster(_ path: String?) -> URL? {
    build(path, size: AppEnvironment.posterSize)
  }

  static func backdrop(_ path: String?) -> URL? {
    build(path, size: AppEnvironment.backdropSize)
  }

  // MARK: Private

  private static func build(_ path: String?, size: String) -> URL? {
    guard let raw = path, !raw.isEmpty else {
      return nil
    }

    if raw.hasPrefix("http://") || raw.hasPrefix("https://") {
      return URL(string: raw)
    }

    let trimmed = raw.hasPrefix("/") ? String(raw.dropFirst()) : raw
    return AppEnvironment.imageBaseURL
      .appendingPathComponent(size)
      .appendingPathComponent(trimmed) // base/size/path
  }
}
