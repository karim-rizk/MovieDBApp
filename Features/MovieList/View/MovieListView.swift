//
//  MovieListView.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 16.07.25.
//

import CoreData
import SwiftUI

// MARK: - ContentView

struct MovieListView: View {
  // MARK: Lifecycle

  init(viewModel: MovieListViewModel) {
    _viewModel = .init(wrappedValue: viewModel)
  }

  // MARK: Internal

  var body: some View {
    NavigationStack {
      List {
        ForEach(viewModel.movies) { movie in
          MovieRowView(movie: movie)
            .onAppear {
              viewModel.fetchNextPageIfNeeded(currentItem: movie)
            }
        }
      }
      .navigationTitle(L10n.Home.Movies.title)
      .onAppear {
        viewModel.fetchInitialMoviesIfNeeded()
      }
    }
  }

  // MARK: Private

  @StateObject private var viewModel: MovieListViewModel
}

#Preview {
  let viewModel = MovieListViewModel(movieService: MockMovieService())
  MovieListView(viewModel: viewModel)
}
