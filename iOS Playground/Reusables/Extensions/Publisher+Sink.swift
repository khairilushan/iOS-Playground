//
//  Publisher+Sink.swift
//  iOS Playground
//
//  Created by Khairil Ushan on 08/06/19.
//  Copyright © 2019 Khairil Ushan. All rights reserved.
//

import Combine

extension Publisher {

	func sink(
		receiveValue: @escaping (Output) -> Void,
		receiveError: @escaping (Failure) -> Void,
		receiveFinished: (() -> Void)? = nil
	) -> Subscribers.Sink<Self> {

		return sink(receiveCompletion: { (completion: Subscribers.Completion<Failure>) in

			switch completion {
			case .failure(let error):
				receiveError(error)

			case .finished:
				receiveFinished?()
			}
		}, receiveValue: { (output: Output) in
			receiveValue(output)
		})
	}
}
