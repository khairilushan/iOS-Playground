//
//  MovieListViewModel.swift
//  iOS Playground
//
//  Created by Khairil Ushan on 05/06/19.
//  Copyright © 2019 Khairil Ushan. All rights reserved.
//

import SwiftUI
import Combine
import Moya

final class MovieListViewModel: BindableObject {

	// MARK: - Public Properties

	let didChange = PassthroughSubject<Void, Never>()

	var isLoading: Bool = false {
		didSet {
			didChange.send(())
		}
	}

	var movies: [MovieCellViewModel] = [] {
		didSet {
			didChange.send(())
		}
	}

	// MARK: - Private Properties

	private let networkModel: MovieNetworkModel

	init(networkModel: MovieNetworkModel = MovieNetworkModel()) {

		self.networkModel = networkModel

		retrieveMovieList()
	}

	// MARK: - Private Methods

	private func retrieveMovieList() {

		_ = networkModel.getMovieList(sort: .popularity(descending: true), year: 2019, page: 1)
			.sink(receiveValue: { [weak self] (value: MovieList) in

				guard let movies = value.result else {
					return
				}
				self?.movies = movies.map(MovieCellViewModel.init(movie:))
			}, receiveError: { (error: Error) in
				print(error.localizedDescription)
			})
	}
}
