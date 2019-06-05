//
//  Movie.swift
//  iOS Playground
//
//  Created by Khairil Ushan on 05/06/19.
//  Copyright © 2019 Khairil Ushan. All rights reserved.
//

import Foundation
import SwiftUI

struct Movie: Hashable, Codable, Identifiable {

	struct Genre: Hashable, Codable {

		let id: Int?
		let name: String?
	}

	struct Langauge: Hashable, Codable {

		enum CodingKeys: String, CodingKey {
			case iso6391 = "iso_639_1"
			case name = "name"
		}

		let iso6391: String?
		let name: String?
	}

	struct ProductionCompany: Hashable, Codable {

		enum CodingKeys: String, CodingKey {
			case id = "id"
			case logoPath = "logo_path"
			case name = "name"
			case originCountry = "origin_country"
		}

		let id: Int?
		let logoPath: String?
		let name: String?
		let originCountry: String?
	}

	struct ProductionCountry: Hashable, Codable {

		enum CodingKeys: String, CodingKey {
			case iso31661 = "iso_3166_1"
			case name = "name"
		}

		var iso31661: String?
		var name: String?
	}

	enum CodingKeys: String, CodingKey {
		case id = "id"
		case title = "title"
		case voteCount = "vote_count"
		case voteAverage = "vote_average"
		case popularity = "popularity"
		case posterPath = "poster_path"
		case language = "language"
		case genreIds = "genre_ids"
		case backdropPath = "backdrop_path"
		case overview = "overview"
		case releaseDate = "release_date"
		case genres = "genres"
		case homepage = "homepage"
		case productCompanies = "production_companies"
		case productCountries = "production_countries"
		case status = "status"
		case tagline = "tagline"
		case budget = "budget"
		case revenue = "revenue"
		case spokenLanguages = "spoken_languages"
		case runtime = "runtime"
	}

	let id: Int?
	let title: String?
	let voteCount: Int?
	let voteAverage: Float?
	let popularity: Float?
	let posterPath: String?
	let language: String?
	let genreIds: [Int]?
	let backdropPath: String?
	let overview: String?
	let releaseDate: String?
	let genres: [Genre]?
	let homepage: String?
	let productCompanies: [ProductionCompany]?
	let productCountries: [ProductionCountry]?
	let status: String?
	let tagline: String?
	let budget: Int?
	let revenue: Int?
	let spokenLanguages: [Langauge]?
	let runtime: Int?
}
