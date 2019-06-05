//
//  MovieNetworkModel.swift
//  iOS Playground
//
//  Created by Khairil Ushan on 05/06/19.
//  Copyright © 2019 Khairil Ushan. All rights reserved.
//

import Foundation
import Moya
import Combine

final class MovieNetworkModel {

	// MARK: - Private Properties

	private let provider: MoyaProvider<MovieMoyaTarget>

	// MARK: - Initialization

	init(provider: MoyaProvider<MovieMoyaTarget> = MoyaProvider<MovieMoyaTarget>()) {
		self.provider = provider
	}

	// MARK: - Public Methods

	func getMovieList(sort: SortType, year: Int, page: Int) -> Publishers.Deferred<AnyPublisher<MovieList, Error>> {
		return provider.requestAsPublisher(target: .discover(sort: sort, year: year, page: page))
	}
}
