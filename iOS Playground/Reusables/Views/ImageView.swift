//
//  ImageView.swift
//  iOS Playground
//
//  Created by Khairil Ushan on 05/06/19.
//  Copyright © 2019 Khairil Ushan. All rights reserved.
//

import SwiftUI
import UIKit

struct ImageView: View {

	@EnvironmentObject var viewModel: ImageViewModel

	var body: some View {
		Image(uiImage: viewModel.image)
	}
}

#if DEBUG
struct ImageView_Previews : PreviewProvider {

	static var previews: some View {
		ImageView().environmentObject(ImageViewModel(imageUrl: "", placeholder: UIImage(named: "placeholder")!))
	}
}
#endif
