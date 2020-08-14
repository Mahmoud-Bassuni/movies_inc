//
//  MovieCoordinator.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import Foundation
import UIKit

class MovieCoordinator: Coordinator   {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
  
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc : MovieListViewController = .instantiate(storyboard: "Movie")
        let viewModel = MovieListViewModel(_movieRepository: MovieRepository())
        viewModel.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: false)
    }
    
    func movieDetails(movieId : Int) {
           let vc : MovieDetailsViewController = .instantiate(storyboard: "Movie")
           let viewModel = MovieDetailsViewModel(_movieRepository: MovieRepository())
           viewModel.movieId = movieId
           viewModel.coordinator = self
           vc.viewModel = viewModel
           navigationController.pushViewController(vc, animated: false)
       }
    
    deinit {
        print("MovieCoordinator ---> deinit")
    }
}
