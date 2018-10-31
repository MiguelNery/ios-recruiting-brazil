//
//  MovieGridErrorState.swift
//  Mov
//
//  Created by Miguel Nery on 28/10/18.
//  Copyright © 2018 Miguel Nery. All rights reserved.
//

import UIKit


class MovieGridErrorState: MovieGridBaseState {
    
    override func hideViews() -> [UIView] {
        return [movieGrid.collection, movieGrid.searchBar, movieGrid.noResultsView]
    }
    
    override func showViews() -> [UIView] {
        return [movieGrid.networkErrorView]
    }
    
}
