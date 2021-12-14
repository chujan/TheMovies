//
//  NetworkManager.swift
//  TheMovies
//
//  Created by Chukwuemeka Jennifer on 06/12/2021.
//

import Foundation
import Alamofire

final class NetworkManger<T: Codable> {
    static func fetch (from urlString: String, Completion: @escaping (Result<T, NetworkError>) -> Void) {
        AF.request(urlString).responseDecodable(of: T.self ) { (resp) in
            if resp.error != nil {
                Completion(.failure(.invalidResponse))
                print(resp.error!)
               // print("Url:: ", urlString)
              //  print("Raw resp:: ", String(data: resp.data!, encoding: .utf8))
                return
            }
            if let payload = resp.value {
                Completion(.success(payload))
                return
            }
            Completion(.failure(.nilResponse))
            
        }
        
    }
}

enum NetworkError: Error {
    case invalidResponse
    case nilResponse
}
