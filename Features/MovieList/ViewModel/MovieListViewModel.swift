//
//  MovieListViewModel.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 01.08.25.
//
import Combine
import Foundation

final class MovieListViewModel: ObservableObject {
  // MARK: Lifecycle

  init(movieService: MovieServiceProtocol) {
    self.movieService = movieService
    fetchPopularMovies()
  }

  // MARK: Internal

  @Published private(set) var movies: [Movie] = []
  @Published private(set) var errorMessage: String?
  @Published private(set) var isLoading: Bool = false

  func fetchPopularMovies() {
    isLoading = true
    errorMessage = nil

    movieService.getPopularMovies()
      .receive(on: DispatchQueue.main)
      .sink { [weak self] completion in
        guard let self else {
          return
        }

        isLoading = false
        if case let .failure(error) = completion {
          errorMessage = error.localizedDescription
        }
      } receiveValue: { [weak self] movies in
        self?.movies = movies
      }
      .store(in: &cancellables)
  }

  // MARK: Private

  private let movieService: MovieServiceProtocol
  private var cancellables: Set<AnyCancellable> = []
}
