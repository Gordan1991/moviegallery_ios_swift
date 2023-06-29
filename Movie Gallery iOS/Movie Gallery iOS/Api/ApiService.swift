//
//  ApiService.swift
//  Movie Gallery iOS
//
//  Created by Gordan Saw on 6/29/23.
//

import Foundation

class ApiService{
    
    let baseUrl = "https://api.themoviedb.org/3/";
    
    let headers = [
      "accept": "application/json",
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MmM5ZjJmMjBmZThjNzIzOTJmOTZjNjQwYzVjOGQ5YSIsInN1YiI6IjY0OTVhNTEzZDVmZmNiMDBhZDg1MDY3OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8fUCYS4ohl34KdhUlD29BC6gqNtsXUILoMb2tEf9fH0"
    ]
    
    
    public func getAllMoviePopularData(completion: @escaping(MovieModel) -> Void){
        guard let url = URL(string: baseUrl + "discover/movie") else {
            return
        }
        
        let request = NSMutableURLRequest(url: url,
                                            cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error as Any)
          } else {
              
              do{
                  let result = try JSONDecoder().decode(MovieModel.self, from: data!)
                  completion(result)
              }catch{
                  print("failed to convert \(error.localizedDescription)")
              }

          }
        })

        dataTask.resume()
    }
    
    
    public func getMovieDetailData(movieId: Int, completion: @escaping(MovieDetailModel) -> Void){
        guard let url = URL(string: baseUrl + "movie/" + String(movieId)) else {
            return
        }
        
        let request = NSMutableURLRequest(url: url,
                                            cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error as Any)
          } else {
              
              do{
                  let result = try JSONDecoder().decode(MovieDetailModel.self, from: data!)
                  completion(result)
              }catch{
                  print("failed to convert \(error.localizedDescription)")
              }

          }
        })

        dataTask.resume()
    }
    
    public func getSearchMovieListData(searchMovie: String, completion: @escaping(MovieModel) -> Void){
        guard let url = URL(string: baseUrl + "search/movie?query=" + searchMovie) else {
            return
        }
        
        let request = NSMutableURLRequest(url: url,
                                            cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error as Any)
          } else {
              
              do{
                  let result = try JSONDecoder().decode(MovieModel.self, from: data!)
                  completion(result)
              }catch{
                  print("failed to convert \(error.localizedDescription)")
              }

          }
        })

        dataTask.resume()
    }
    
}
