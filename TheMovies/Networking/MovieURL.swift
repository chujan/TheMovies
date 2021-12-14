//
//  MovieURL.swift
//  TheMovies
//
//  Created by Chukwuemeka Jennifer on 06/12/2021.
//

import Foundation

enum MovieURL: String {
    case nowPlaying = "now_playing"
    case upcoming = "upcoming"
    case popular = "popular"
    
    public var urlString: String {
        
        "\(MovieDownLoadManager.baseURL)\(self.rawValue)?api_key=\(API.key)&language=en-US&page=1"
       
        
    }
}
