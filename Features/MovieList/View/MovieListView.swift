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
          Text(movie.title)
        }
      }.navigationTitle(L10n.Home.Movies.title)
    }
  }

  // MARK: Private

  @StateObject private var viewModel: MovieListViewModel
}

// #Preview {
//  MovieListView()
// }
