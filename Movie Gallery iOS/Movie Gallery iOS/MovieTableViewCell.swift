//
//  MovieTableViewCell.swift
//  Movie Gallery iOS
//
//  Created by Gordan Saw on 6/29/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblMovieReleaseDate: UILabel!
    @IBOutlet weak var ivMovieImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
