//
//  ActorTableViewCell.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import UIKit

class ActorTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var charactorNameLable: UILabel!
    @IBOutlet weak var actorNameLable: UILabel!
    @IBOutlet weak var actorImageView: UIImageView!
    
   
    
    func bindCell(viewModel : MovieActorViewModel) {
        charactorNameLable.text = viewModel.characterName
        actorNameLable.text = viewModel.actorName
        if let  url = viewModel.posterPath {
            actorImageView.kf.indicatorType = .activity
            actorImageView.kf.setImage(
                with: url,
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
            ])
        }
    }
    
}
