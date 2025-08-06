//
//  MovieListComposer.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 02.08.25.
//

import SwiftUI

enum MovieListComposer {
  @MainActor
  static func composeView() -> some View {
    let httpClient: HTTPClient = URLSessionHTTPClient(baseURL: AppEnvironment.baseURL, accessToken: AppEnvironment.tmdbToken)

    let service: MovieServiceProtocol = RemoteMovieService(httpClient: httpClient)

    let viewModel = MovieListViewModel(movieService: service)
    return MovieListView(viewModel: viewModel)
  }
}
