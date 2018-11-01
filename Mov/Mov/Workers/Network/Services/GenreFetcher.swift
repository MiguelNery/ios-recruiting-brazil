//
//  GenreFetcher.swift
//  Mov
//
//  Created by Miguel Nery on 01/11/18.
//  Copyright © 2018 Miguel Nery. All rights reserved.
//

import Foundation

protocol GenreFetcher {
    func fetchGenres(_ completion: @escaping (Result<[Genre]>) -> Void)
}
