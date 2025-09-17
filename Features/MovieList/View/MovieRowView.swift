//
//  MovieRowView.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 14.09.25.
//

import SwiftUI

struct MovieRowView: View {
  let movie: Movie

  var body: some View {
    HStack(spacing: 12) {
      PosterView(url: movie.posterURL, width: 90, height: 135, cornerRadius: 10)

      VStack(alignment: .leading, spacing: 6) {
        Text(movie.title)
          .font(.headline)
          .lineLimit(2)

        if !movie.overview.isEmpty {
          Text(movie.overview)
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .lineLimit(3)
        }

        HStack(spacing: 8) {
          Image(systemName: "star.fill")
            .foregroundStyle(.yellow)
          Text(String(format: "%.1f", movie.voteAverage))
            .font(.subheadline)
            .foregroundStyle(.secondary)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Rating \(movie.voteAverage, specifier: "%.1f")")
      }

      Spacer()
    }
    .contentShape(Rectangle())
  }
}

#Preview {
  let service = MockMovieService()
  MovieRowView(movie: service.loadPreviewMovies().first!)
}
