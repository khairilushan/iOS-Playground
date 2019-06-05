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

	let didChange = PassthroughSubject<MovieListViewModel, Never>()

	var isLoading: Bool = false {
		didSet {
			didChange.send(self)
		}
	}

	var movies: [MovieRowViewModel] = [] {
		didSet {
			didChange.send(self)
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

		networkModel.getMovieList(sort: .popularity(descending: true), year: 2019, page: 1)
			.subscribe(
				AnySubscriber(
					receiveSubscription: nil,
					receiveValue: { [weak self] (value: MovieList) -> Subscribers.Demand in

						if let movies = value.result {
							self?.movies = movies.map(MovieRowViewModel.init(movie:))
						}
						return .unlimited
					},
					receiveCompletion: nil
				)
			)
	}
}
