//
//  ViewController.swift
//  Movie Gallery iOS
//
//  Created by Gordan Saw on 6/24/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var loadingBar: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var data = [Result]()
    let apiService = ApiService()
    var searchMovie = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadingBar.style = .large
        loadingBar.startAnimating()
        
        apiService.getAllMoviePopularData(){ result in
            print("response json data: \(result.results)")
            self.data = result.results!
            DispatchQueue.main.sync {
                self.loadingBar.stopAnimating()
                self.loadingBar.hidesWhenStopped=true
                self.tableView.reloadData()
            }
        }
    }
    
    
    @IBAction func searchBtnClick(_ sender: Any) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SearchMovieViewController") as? SearchMovieViewController{
            vc.searchMovie = searchMovie
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieResult = data[indexPath.row]
        if let vc = storyboard?.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController{
            vc.movieId = movieResult.id ?? 0
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MovieTableViewCell
        cell.lblMovieTitle.text = data[indexPath.row].title
        cell.lblMovieTitle.font = .boldSystemFont(ofSize: 17)
        cell.lblMovieReleaseDate.text = "Release Date: " + (data[indexPath.row].release_date ?? "")
        cell.ivMovieImg.downloaded(from: "https://image.tmdb.org/t/p/w500/" + (data[indexPath.row].poster_path ?? ""),contentMode: .scaleAspectFit)
        return cell
    }
}


extension UIImageView{
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit){
        contentMode = mode
        
        URLSession.shared.dataTask(with: url){data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {return}
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
            
        }.resume();
    }
    
    func downloaded(from link:String, contentMode mode: ContentMode = .scaleAspectFit){
        guard let url = URL(string: link) else {return}
        downloaded(from: url,contentMode: mode)
        
    }
}

extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchMovie = searchText;
        
        //print("searchBar data: \(searchText)")
    }
}

