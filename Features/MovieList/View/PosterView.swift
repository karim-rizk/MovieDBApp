//
//  PosterView.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 14.09.25.
//

import SwiftUI

// MARK: - PosterView

struct PosterView: View {
  // MARK: Lifecycle

  init(url: URL?, width: CGFloat = 100, height: CGFloat = 150, cornerRadius: CGFloat = 8) {
    self.url = url
    self.width = width
    self.height = height
    self.cornerRadius = cornerRadius
  }

  // MARK: Internal

  let url: URL?
  let width: CGFloat
  let height: CGFloat
  let cornerRadius: CGFloat

  var body: some View {
    Group {
      if let url {
        // Smooth fade-in on first load
        AsyncImage(url: url, transaction: Transaction(animation: .easeIn(duration: 0.2))) { phase in
          switch phase {
          case .empty:
            placeholder

          case let .success(image):
            image
              .resizable()
              .scaledToFill()
              .transition(.opacity)

          case .failure:
            fallback

          @unknown default:
            fallback
          }
        }
      } else {
        fallback
      }
    }
    .frame(width: width, height: height)
    .clipped()
    .cornerRadius(cornerRadius)
    .accessibilityHidden(true)
  }

  // MARK: Private

  private var placeholder: some View {
    ZStack {
      Rectangle().fill(Color.secondary.opacity(0.15))
      ProgressView()
    }
  }

  private var fallback: some View {
    ZStack {
      Rectangle().fill(Color.secondary.opacity(0.15))
      Image(systemName: "photo")
        .imageScale(.large)
        .foregroundStyle(.secondary)
    }
  }
}

#Preview("Valid URL") {
  PosterView(url: URL(string: "https://image.tmdb.org/t/p/w500/x26MtUlwtWD26d0G0FXcppxCJio.jpg")!, width: 300, height: 500)
}

#Preview("Nil URL") {
  PosterView(url: nil, width: 300, height: 500)
}

#Preview("Broken URL") {
  PosterView(url: URL(string: "https://example.com/does-not-exist.jpg"), width: 300, height: 500)
}
