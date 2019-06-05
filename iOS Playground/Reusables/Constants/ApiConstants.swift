//
//  ApiConstants.swift
//  iOS Playground
//
//  Created by Khairil Ushan on 05/06/19.
//  Copyright © 2019 Khairil Ushan. All rights reserved.
//

import Foundation

struct ApiConstants {

	static let baseUrl = "https://api.themoviedb.org/3"
	static let apiKey = "14bc774791d9d20b3a138bb6e26e2579"
	static let imageBaseUrl = "https://image.tmdb.org/t/p"

	static func getImageUrl(width: Int = 300, path: String) -> String {
		return "\(ApiConstants.imageBaseUrl)/w\(width)\(path)"
	}

}
