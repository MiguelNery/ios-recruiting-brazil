//
//  FavoriteMoviesUserDefaultsPersistence.swift
//  Mov
//
//  Created by Miguel Nery on 29/10/18.
//  Copyright © 2018 Miguel Nery. All rights reserved.
//

import Foundation

class UserDefaultsGateway {
    private static let moviesKey = "Movies"
    
    private(set) var favorites = Set<Movie>()
    
    let defaults = UserDefaults.standard
    
    init() {
        // initialize favorites to avoid addFavorite from overriding saved data
        fetchFavorites()
    }
}

extension UserDefaultsGateway: FavoritesPersistence {
    
    func toggleFavorite(movie: Movie) -> Bool {
        if self.favorites.contains(movie) {
            self.favorites.remove(movie)
        } else {
            self.favorites.insert(movie)
        }
        
        return self.saveFavorites()
    }
    
    /**
     Return: Set of movies if it succeed to fecth movies. Empty set if there are no saved favorites. Nil if it fail to decode fetched movies.
     */
    func fetchFavorites() -> [Movie]? {
        guard self.favorites.isEmpty else { return Array(self.favorites) }
        
        if let savedMovies = self.defaults.object(forKey: UserDefaultsGateway.moviesKey) as? Data {
            let decoder = API.TMDB.decoder
            if let loadedMovies = try? decoder.decode([Movie].self, from: savedMovies) {
                self.favorites = Set<Movie>(loadedMovies)
                return Array(self.favorites)
            } else { return nil }
            
        } else { return [] }
    }
    
    /**
     Return ```true``` if succeed to save favorites. Return ```false``` if it fail to save favorites.
     */
    func saveFavorites() -> Bool {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        encoder.dateEncodingStrategy = .formatted(API.TMDB.dateFormatter)
        
        if let encoded = try? encoder.encode(self.favorites) {
            self.defaults.set(encoded, forKey: UserDefaultsGateway.moviesKey)
            return true
        } else { return false }
    }
    
    func isFavorite(_ movie: Movie) -> Bool {
        return self.favorites.contains(movie)
    }
}
