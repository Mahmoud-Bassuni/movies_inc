//
//  MovieTableViewCell.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import UIKit
import Kingfisher
import Cosmos
class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieTitleLable: UILabel!
    @IBOutlet weak var releaseDateLable: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieRateView: CosmosView!
    func bindCell(viewModel : MovieViewModel) {
        movieTitleLable.text = viewModel.title
        releaseDateLable.text = viewModel.releaseDate
        movieTitleLable.text = viewModel.title
        movieRateView.rating = viewModel.voteAverage
        if let  url = viewModel.posterPath {
            moviePosterImageView.kf.setImage(with:url)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
