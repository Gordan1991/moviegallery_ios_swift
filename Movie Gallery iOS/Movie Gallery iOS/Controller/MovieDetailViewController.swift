//
//  MovieDetailViewController.swift
//  Movie Gallery iOS
//
//  Created by Gordan Saw on 6/29/23.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var lblMovieDetailTitle: UILabel!
    @IBOutlet weak var lblMovieDetailReleaseDate: UILabel!
    @IBOutlet weak var ivMovieDetailImg: UIImageView!
    let apiService = ApiService()
    var movieId: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("MovieDetailViewController movieId: \(movieId)")
        
        apiService.getMovieDetailData(movieId: movieId){ result in
            print("MovieDetailViewController response json data: \(result.title)")
      
            DispatchQueue.main.sync {
                
                self.lblMovieDetailTitle.text = result.title
                self.lblMovieDetailTitle.font = .boldSystemFont(ofSize: 17)
                self.lblMovieDetailReleaseDate.text = "Release Date: " + (result.release_date ?? "")
                self.ivMovieDetailImg.downloaded(from: "https://image.tmdb.org/t/p/w500/" + (result.poster_path ?? ""),contentMode: .scaleAspectFit)
              
            }
        }

    }
    
}
