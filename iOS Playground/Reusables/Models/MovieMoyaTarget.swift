//
//  MovieMoyaTarget.swift
//  iOS Playground
//
//  Created by Khairil Ushan on 05/06/19.
//  Copyright © 2019 Khairil Ushan. All rights reserved.
//

import Foundation
import Moya

enum SortType {
	case popularity(descending: Bool)
	case releaseDate(descending: Bool)
	case revenue(descending: Bool)
	case title(descending: Bool)
	case voteAverage(descending: Bool)
	case voteCount(descending: Bool)

	func getUrlQueryValue() -> String {

		switch self {
		case .popularity(let descending):
			return "popularity.\(getSortValue(descending: descending))"
		case .releaseDate(let descending):
			return "release_date.\(getSortValue(descending: descending))"
		case .revenue(let descending):
			return "revenue.\(getSortValue(descending: descending))"
		case .title(let descending):
			return "original_title.\(getSortValue(descending: descending))"
		case .voteAverage(let descending):
			return "vote_average.\(getSortValue(descending: descending))"
		case .voteCount(let descending):
			return "vote_count.\(getSortValue(descending: descending))"
		}
	}

	// MARK: - Private Methods

	private func getSortValue(descending: Bool) -> String {

		var sort: String
		if descending {
			sort = "desc"
		} else {
			sort = "asc"
		}
		return sort
	}
}

enum MovieMoyaTarget {
	case searchMovie(query: String, page: Int)
	case discover(sort: SortType, year: Int, page: Int)
	case movieDetail(id: Int)
}

extension MovieMoyaTarget: TargetType {

	var baseURL: URL {

		guard let validUrl = URL(string: ApiConstants.baseUrl) else {
			return NSURL() as URL
		}
		return validUrl
	}

	var headers: [String : String]? {
		return [:]
	}

	var path: String {

		switch self {
		case .searchMovie:
			return "/search/movie"

		case .discover:
			return "/discover/movie"

		case .movieDetail(let id):
			return "/movie/\(id)"
		}
	}

	var method: Moya.Method {
		return .get
	}

	var parameters: [String : Any] {

		switch self {
		case .searchMovie(let query, let page):
			return [
				"api_key": ApiConstants.apiKey,
				"query": query,
				"page": page
			]

		case .discover(let sort, let year, let page):
			return [
				"api_key": ApiConstants.apiKey,
				"sort_by": sort.getUrlQueryValue(),
				"page": page,
				"year": year
			]

		case .movieDetail:
			return [
				"api_key": ApiConstants.apiKey
			]
		}
	}

	var parameterEncoding: ParameterEncoding {
		return URLEncoding.default
	}

	var sampleData: Data {
		return Data()
	}

	var task: Task {
		return .requestParameters(parameters: parameters, encoding: parameterEncoding)
	}

}
