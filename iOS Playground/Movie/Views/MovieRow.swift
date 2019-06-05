//
//  MovieRow.swift
//  iOS Playground
//
//  Created by Khairil Ushan on 04/06/19.
//  Copyright © 2019 Khairil Ushan. All rights reserved.
//

import SwiftUI

struct MovieRow : View {

	@EnvironmentObject var movie: MovieRowViewModel

	var body: some View {
		VStack(alignment: .leading) {
			Image(uiImage: movie.posterImage)
				.resizable()
				.aspectRatio(2, contentMode: .fit)
				.clipped()
				.cornerRadius(5)
				.shadow(radius: 5)

			Text(movie.title)
				.font(.headline)

			Text(movie.overview)
				.font(.subheadline)
				.lineLimit(3)
				.multilineTextAlignment(.leading)
		}
    }
}

#if DEBUG
struct MovieRow_Previews : PreviewProvider {

	static var previews: some View {

		let rowViewModel = MovieRowViewModel(
			id: 0,
			title: "Captain Marvel",
			overview: "Description",
			posterUrl: "",
			posterImage: UIImage(named: "placeholder")!
		)

		return MovieRow().environmentObject(rowViewModel)
    }
}
#endif
