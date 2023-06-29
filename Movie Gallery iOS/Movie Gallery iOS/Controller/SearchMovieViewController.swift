//
//  SearchMovieViewController.swift
//  Movie Gallery iOS
//
//  Created by Gordan Saw on 6/29/23.
//

import UIKit

class SearchMovieViewController: UIViewController {

    @IBOutlet weak var loadingBar: UIActivityIndicatorView!
    @IBOutlet weak var tableViewSearchMovie: UITableView!
    @IBOutlet weak var searchMovieHeader: UILabel!
    var data = [Result]()
    let apiService = ApiService()
    var searchMovie: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadingBar.style = .large
        loadingBar.startAnimating()
        
        
        searchMovieHeader.text = "Search Results : " + searchMovie
        
        apiService.getSearchMovieListData(searchMovie: searchMovie){ result in
            print("response json data: \(result.results)")
            self.data = result.results!
            DispatchQueue.main.sync {
                self.loadingBar.stopAnimating()
                self.loadingBar.hidesWhenStopped=true
                self.tableViewSearchMovie.reloadData()
            }
        }
        
    }
    
    @IBAction func searchButtonClick(_ sender: Any) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SearchMovieViewController") as? SearchMovieViewController{
            vc.searchMovie = searchMovie
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension SearchMovieViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieResult = data[indexPath.row]
        if let vc = storyboard?.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController{
            vc.movieId = movieResult.id!
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SearchMovieTableViewCell
        cell.lblSearchMovieTitle.text = data[indexPath.row].title
        cell.lblSearchMovieTitle.font = .boldSystemFont(ofSize: 17)
        cell.lblSearchMovieReleaseDate.text = "Release Date: " + (data[indexPath.row].release_date ?? "")
        cell.ivsearchMovieImg.downloaded(from: "https://image.tmdb.org/t/p/w500/" + (data[indexPath.row].poster_path ?? ""),contentMode: .scaleAspectFit)
        return cell
    }
}

