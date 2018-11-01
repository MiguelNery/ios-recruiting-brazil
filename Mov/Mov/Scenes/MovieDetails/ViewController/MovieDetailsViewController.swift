//
//  MovieDetailsViewController.swift
//  Mov
//
//  Created by Miguel Nery on 01/11/18.
//  Copyright © 2018 Miguel Nery. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    let movie: Movie
    
    var viewModel = MovieDetailsViewModel.placeHolder {
        didSet {
            self.viewModel.fetchImage(to: self.movieDetailsview.poster)
            self.movieDetailsview.tableView.reloadData()
        }
    }
    
    var interactor: MovieDetaisInteractor? {
        didSet {
            if let interactor = self.interactor {
                interactor.getDetails(of: self.movie)
            }
        }
    }
    
    lazy var movieDetailsview: MovieDetailsView = {
        return MovieDetailsView(frame: .zero)
    }()
    
    override func loadView() {
        let view = BlankView()
        self.view = view
        self.setup()
    }

    init(movie: Movie) {
        super.init(nibName: nil, bundle: nil)
        self.movie = movie
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieDetailsViewController: ViewCode {
    func addView() {
        self.view.addSubview(self.movieDetailsview)
    }
    
    func addConstraints() {
        self.movieDetailsview.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
    }
    
    func additionalSetup() {
        self.movieDetailsview.tableView.dataSource = self
    }
}

extension MovieDetailsViewController: MovieDetailsViewOutput {
    func displayDetails(of movie: MovieDetailsViewModel) {
        self.
    }
    
}
