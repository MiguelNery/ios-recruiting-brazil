//
//  MovieListFetchWorker.swift
//  ShitMov
//
//  Created by Miguel Nery on 23/10/18.
//  Copyright © 2018 Miguel Nery. All rights reserved.
//

import Foundation

protocol MovieFetcher {
    func fetchMovies() -> [Movie]?
}
