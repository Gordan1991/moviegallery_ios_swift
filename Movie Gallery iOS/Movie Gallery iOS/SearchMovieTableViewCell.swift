//
//  SearchMovieTableViewCell.swift
//  Movie Gallery iOS
//
//  Created by Gordan Saw on 6/29/23.
//

import UIKit

class SearchMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var lblSearchMovieReleaseDate: UILabel!
    @IBOutlet weak var lblSearchMovieTitle: UILabel!
    @IBOutlet weak var ivsearchMovieImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
