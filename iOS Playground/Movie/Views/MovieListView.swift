//
//  MovieList.swift
//  iOS Playground
//
//  Created by Khairil Ushan on 04/06/19.
//  Copyright © 2019 Khairil Ushan. All rights reserved.
//

import SwiftUI

struct MovieListView : View {

	@ObjectBinding var viewModel: MovieListViewModel

	var body: some View {
		NavigationView {
			List(viewModel.movies) { movie in
				MovieCell(movie: movie)
			}
			.navigationBarTitle(Text("Movies"))
		}
    }
}

#if DEBUG
struct MovieListView_Previews : PreviewProvider {

	static var previews: some View {
		MovieListView(viewModel: MovieListViewModel())
	}
}
#endif
