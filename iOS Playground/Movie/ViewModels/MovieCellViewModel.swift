//
//  MovieRowViewModel.swift
//  iOS Playground
//
//  Created by Khairil Ushan on 05/06/19.
//  Copyright © 2019 Khairil Ushan. All rights reserved.
//

import Foundation
import SwiftUI
import Alamofire
import AlamofireImage
import Combine

final class MovieCellViewModel: BindableObject {

	let didChange = PassthroughSubject<Void, Never>()
	let id: Int
	let title: String
	let overview: String
	let posterUrl: String

	var posterImage: UIImage {
		didSet {
			didChange.send(())
		}
	}

	init(
		id: Int,
		title: String,
		overview: String,
		posterUrl: String,
		posterImage: UIImage
	) {

		self.id = id
		self.title = title
		self.overview = overview
		self.posterUrl = posterUrl
		self.posterImage = posterImage
	}

	init(movie: Movie) {

		self.id = movie.id ?? 0
		self.title = movie.title ?? ""
		self.overview = movie.overview ?? ""
		self.posterUrl = ApiConstants.getImageUrl(path: movie.backdropPath ?? "")
		self.posterImage = UIImage(named: "placeholder")!

		fetchImage(from: posterUrl)
	}

	private func fetchImage(from url: String)  {

		Alamofire.request(url).responseImage { [weak self] response in

			guard let image = response.result.value else {
				return
			}
			self?.posterImage = image
		}
	}
}
