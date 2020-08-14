//
//  MovieListViewController.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MovieListViewController: UIViewController , UITableViewDelegate {
    
    @IBOutlet weak var moviesTableView: UITableView!
    
    let disposeBag = DisposeBag()
    var viewModel: MovieListViewModel! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel?.getMovies()
    }
    
    func setupTableView(){
        moviesTableView.register(UINib.init(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: MovieTableViewCell.identifier)
        setupTableViewDataSource()
        setupSearchPlacesTableViewDataDelegate()
    }
    
    func setupTableViewDataSource() {
        if let viewModel = viewModel {
            viewModel.onShowError
                .map { [weak self] in self?.alert(title: "error", message: $0)}
                .subscribe()
                .disposed(by: disposeBag)
            
            viewModel.movies.filter({$0.count > 0}).bind(to: moviesTableView!.rx.items) {  [weak self] tableView, index, element in
                
                if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as? MovieTableViewCell{
                    
                    let movie = self?.viewModel?.moviesAtIndex(index)
                    if let movie = movie {
                        cell.bindCell(viewModel: movie)
                    }
                    
                    return cell
                }
                
                return UITableViewCell()
            }.disposed(by: disposeBag)
        }
        
    }
    
    func setupSearchPlacesTableViewDataDelegate()
    {
        moviesTableView!.rx
            .modelSelected(MoviesModelResult.self)
            .subscribe(onNext:  { [weak self] value in
                self?.viewModel.coordinator?.movieDetails(movieId : value.id)
            })
            .disposed(by: disposeBag)
        
        moviesTableView!
            .rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
    
}
