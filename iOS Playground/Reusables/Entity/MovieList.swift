//
//  MovieList.swift
//  iOS Playground
//
//  Created by Khairil Ushan on 05/06/19.
//  Copyright © 2019 Khairil Ushan. All rights reserved.
//

import Foundation

struct MovieList: Codable {

	enum CodingKeys: String, CodingKey {
		case page = "page"
		case totalResult = "total_results"
		case totalPages = "total_pages"
		case result = "results"
	}

	let page: Int?
	let totalResult: Int?
	let totalPages: Int?
	let result: [Movie]?
}
