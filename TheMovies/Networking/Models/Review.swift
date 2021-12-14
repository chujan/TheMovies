//
//  Review.swift
//  TheMovies
//
//  Created by Chukwuemeka Jennifer on 06/12/2021.
//

import Foundation
struct ReviewResponse: Codable {
    var results: [Review]
}
struct Review: Codable, Identifiable {
    var id: String?
    var author: String?
    var content: String?
}
