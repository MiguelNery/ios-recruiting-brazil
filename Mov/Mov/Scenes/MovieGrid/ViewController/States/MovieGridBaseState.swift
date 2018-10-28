//
//  MovieGridBaseState.swift
//  Mov
//
//  Created by Miguel Nery on 28/10/18.
//  Copyright © 2018 Miguel Nery. All rights reserved.
//

import UIKit

class MovieGridBaseState: ViewState {
    unowned let vc: MovieGridViewController
    
    init(viewController: MovieGridViewController) {
        self.vc = viewController
    }
    
    func hideViews() -> [UIView] {
        return []
    }
    
    func showViews() -> [UIView] {
        return []
    }
}
