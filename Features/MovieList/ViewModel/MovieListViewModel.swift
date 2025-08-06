//
//  MovieListViewModel.swift
//  MovieDBApp
//
//  Created by Karim Rizk on 01.08.25.
//
import Combine
import Foundation

@MainActor
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

  func fetchInitialMoviesIfNeeded() {
    guard movies.isEmpty else {
      return
    }

    fetchPopularMovies()
  }

  func fetchNextPageIfNeeded(currentItem: Movie) {
    guard let lastItem = movies.last else {
      return
    }
    guard currentItem.id == lastItem.id else {
      return
    }

    fetchPopularMovies()
  }

  // MARK: Private

  private var currentPage: Int = 1
  private var totalPages: Int = 1
  private var loadedMovieIDs: Set<Int> = []

  private let movieService: MovieServiceProtocol
  private var cancellables: Set<AnyCancellable> = []

  private func fetchPopularMovies() {
    guard !isLoading, currentPage <= totalPages else {
      return
    }

    isLoading = true
    errorMessage = nil

    movieService
      .getPopularMovies(at: currentPage)
      .receive(on: DispatchQueue.main)
      .sink { [weak self] completion in
        guard let self else {
          return
        }

        isLoading = false
        if case let .failure(error) = completion {
          errorMessage = error.localizedDescription
        }
      } receiveValue: { [weak self] result in
        self?.appendUniqueMovies(result.movies)
        self?.currentPage = result.page + 1
        self?.totalPages = result.totalPages
      }
      .store(in: &cancellables)
  }

  private func appendUniqueMovies(_ newMovies: [Movie]) {
    let uniqueMovies = newMovies.filter { loadedMovieIDs.insert($0.id).inserted }
    movies.append(contentsOf: uniqueMovies)
  }
}
