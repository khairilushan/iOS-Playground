//
//  ImageViewModel.swift
//  iOS Playground
//
//  Created by Khairil Ushan on 05/06/19.
//  Copyright © 2019 Khairil Ushan. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Alamofire
import AlamofireImage

final class ImageViewModel: BindableObject {

	let didChange = PassthroughSubject<ImageViewModel, Never>()

	var image: UIImage

	private var placeholder: UIImage

	init(imageUrl: String, placeholder: UIImage) {

		self.image = placeholder
		self.placeholder = placeholder

		fetchImage(from: imageUrl)
	}

	private func fetchImage(from url: String)  {

		Alamofire.request(url).responseImage { [weak self] response in

			guard let image = response.result.value else {
				return
			}
			self?.image = image
		}
	}
}
