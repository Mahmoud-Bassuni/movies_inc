//
//  MovieDetailsViewController.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import Foundation
import UIKit
import Cosmos
import RxSwift


class MovieDetailsViewController: UIViewController  {
    
    @IBOutlet weak var movieTitleLable: UILabel!
    @IBOutlet weak var releaseDateLable: UILabel!
    @IBOutlet weak var overviewLable: UILabel!
    @IBOutlet weak var genreLable: UILabel!
    @IBOutlet weak var movieRateView: CosmosView!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var actorTableView: UITableView!
    
    var viewModel: MovieDetailsViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModelConfig()
    }
    
    @IBAction func btnRanckAction(_ sender: Any) {
        let vc : MovieRankViewController = .instantiate(storyboard: "Movie")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func viewModelConfig() {
        if let viewModel = viewModel {
            viewModel.movie.filter({ $0 != nil }).map {
                [weak self]  in
                if let self = self {
                    self.movieTitleLable.text = $0?.title
                    self.releaseDateLable.text = $0?.releaseDate
                    self.overviewLable.text = $0?.overview
                    self.genreLable.text = $0?.genres
                    self.movieRateView.rating = $0?.voteAverage ?? 0
                    if let  url = $0?.posterPath {
                        self.moviePosterImageView.kf.setImage(with:url)
                    }
                }
            }.subscribe()
                .disposed(by: disposeBag)
            viewModel.getMovieDetails()
        }
    }
    
    func setupTableView(){
        actorTableView.register(UINib.init(nibName: "ActorTableViewCell", bundle: nil), forCellReuseIdentifier: ActorTableViewCell.identifier)
        setupTableViewDataSource()
        
    }
    
    func setupTableViewDataSource() {
        if let viewModel = viewModel {
            viewModel.movieActor.filter({$0.count > 0}).bind(to: actorTableView!.rx.items) {  [weak self] tableView, index, element in
                
                if let cell = tableView.dequeueReusableCell(withIdentifier: "ActorTableViewCell") as? ActorTableViewCell{
                    let actor = self?.viewModel?.actorsAtIndex(index)
                    if let actor = actor {
                        cell.bindCell(viewModel: actor)
                    }
                    return cell
                }
                
                return UITableViewCell()
            }.disposed(by: disposeBag)
        }
        
    }
    
}
