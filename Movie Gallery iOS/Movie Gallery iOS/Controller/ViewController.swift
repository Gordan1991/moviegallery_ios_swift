//
//  ViewController.swift
//  Movie Gallery iOS
//
//  Created by Gordan Saw on 6/24/23.
//

import UIKit

class ViewController: UIViewController {
    
    var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchDataFromApi()
        
    }
    
    func fetchDataFromApi(){
        // Define the API endpoint URL
               guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie") else {
                   return
               }
        
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MmM5ZjJmMjBmZThjNzIzOTJmOTZjNjQwYzVjOGQ5YSIsInN1YiI6IjY0OTVhNTEzZDVmZmNiMDBhZDg1MDY3OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8fUCYS4ohl34KdhUlD29BC6gqNtsXUILoMb2tEf9fH0"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error as Any)
          } else {
              var result: Response?
              
              do{
                  result = try JSONDecoder().decode(Response.self, from: data!)
              }catch{
                  print("failed to convert \(error.localizedDescription)")
              }
              
              guard let json = result else{
                  return
              }
              
              json.results.forEach { data in
                  print("response json data: \(data.original_title)")

              }

          }
        })

        dataTask.resume()
    }


}


