//
//  MovieDownLoadManager.swift
//  TheMovies
//
//  Created by Chukwuemeka Jennifer on 07/12/2021.
//

import SwiftUI

final class MovieDownLoadManager: ObservableObject{
    @Published var movies = [Movie]()
    @Published var cast = [Cast]()
   
    static var baseURL = "https://api.themoviedb.org/3/movie/"
    func  getNowPlaying() {
        getMovie(movieUrl: .nowPlaying)
        
    }
    func getUpcoming() {
        getMovie(movieUrl: .upcoming)
        
    }
    func getPopular() {
        getMovie(movieUrl: .popular)
        
    }
    func getCast(for movie: Movie) {
        let urlString = "\(Self.baseURL)\(movie.id ?? 100)/credits?api_key=\(API.key)&language=en-US"
        NetworkManger<CastResponse>.fetch(from: urlString) { (result) in
            print("Url::", urlString)
            switch result {
            case .success(let response):
                self.cast = response.cast
            case.failure(let err):
                print(err)
            }
           
            
            
            
        }
    }
    private func getMovie(movieUrl: MovieURL) {
        NetworkManger<MovieResponse>.fetch(from: movieUrl.urlString) { (result) in
            print("Url::", movieUrl.urlString)
            switch result {
            case .success(let movieReponse):
                self.movies = movieReponse.movieRes
            case .failure(let err):
                print(err)
            }
            
        }
        
       
    }
    
}
