//
//  MovieRankViewController.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import Foundation
import UIKit
import Cosmos
import RxSwift
class MovieRankViewController: UIViewController  {
    
    @IBOutlet weak var rankProp: CosmosView!
    
    let disposeBag = DisposeBag()
    var viewModel : MovieRankViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelConfig()
    }

    func viewModelConfig() {
        if let viewModel = viewModel {
        viewModel.onShowError
                       .map { [weak self] in self?.alert(title: "error", message: $0)}
                       .subscribe()
                       .disposed(by: disposeBag)
        
        viewModel.onSuccess.subscribe( { value in
             self.dismiss(animated: true)
        }).disposed(by: disposeBag)
        }
    }
    
    
    @IBAction func rankBtnAction(_ sender: Any) {
        viewModel.rankValue = rankProp.rating
        viewModel.SubmitMovieRank()
    }
    
    @IBAction func exitBtnTapped(){
          self.dismiss(animated: true)
       }
    
}
