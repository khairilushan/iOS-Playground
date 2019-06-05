//
//  Moya+Publisher.swift
//  iOS Playground
//
//  Created by Khairil Ushan on 05/06/19.
//  Copyright © 2019 Khairil Ushan. All rights reserved.
//

import Foundation
import Moya
import Combine

extension MoyaProvider {

	func requestAsPublisher<Output>(target: Target) -> Publishers.Deferred<AnyPublisher<Output, Error>>
	where Output: Codable {

		return Publishers.Deferred {
			return AnyPublisher<Output, Error> { subscriber in

				self.request(target) { result in

					switch result {
					case .success(let response):
						do {
							let result = try JSONDecoder().decode(Output.self, from: response.data)
							_ = subscriber.receive(result)
							subscriber.receive(completion: .finished)
						} catch {
							subscriber.receive(completion: .failure(error))
						}

					case .failure(let error):
						subscriber.receive(completion: .failure(error))
					}
				}
			}
		}
	}
}

