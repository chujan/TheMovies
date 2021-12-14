//
//  Movie.swift
//  TheMovies
//
//  Created by Chukwuemeka Jennifer on 06/12/2021.
//[

import Foundation


struct MovieResponse: Codable {
    let movieRes: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case movieRes = "results"
    }
}
struct Movie: Codable, Identifiable {
    var id: Int?
    var title: String?
    var original_language: String?
    var overview: String?
    var poster_path: String?
    var backdrop_path: String?
    var popularity: Double?
    var vote_average: Double?
    var vote_count: Int?
    var adult: Bool?
    var video: Bool?
    var release_date: String?
    var posterPath: String {
        
        if let path = poster_path {
           
            
            return "https://image.tmdb.org/t/p/w500/\(path)"
        } else {
            return ""
        }
    }
    var voteAverage: Double {
        if let avg = vote_average {
            return avg / 10.0
        }
        return 0.0
    }
    var titleWithLanguage: String {
        guard let title = title, let lang = original_language else 
            {return ""}
            return "\(title)(\(lang))"

        

    }
    
}
