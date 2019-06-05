//
//  Image+LoadFromUrl.swift
//  iOS Playground
//
//  Created by Khairil Ushan on 05/06/19.
//  Copyright © 2019 Khairil Ushan. All rights reserved.
//

import Foundation
import SwiftUI
import Alamofire
import AlamofireImage

extension SwiftUI.Image {

	init(urlString: String, placeholder: SwiftUI.Image) {

		switch ImageStore.shared.image(url: urlString) {
		case .some(let image):
			self = image

		case .none:
			self = placeholder
		}
	}

	private final class ImageStore {

		private typealias ImageDictionary = [String: SwiftUI.Image]

		private var images: ImageDictionary = [:]

		static var shared = ImageStore()

		func image(url: String) -> SwiftUI.Image? {

			if let image = images[url] {
				return image
			} else {
				loadImage(fromUrl: url)
			}

			return nil
		}

		private func loadImage(fromUrl url: String) {

			
		}
	}
}
