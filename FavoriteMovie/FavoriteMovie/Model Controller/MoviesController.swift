//
//  MoviesController.swift
//  FavoriteMovie
//
//  Created by Nelson Gonzalez on 4/7/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation

class MoviesController {
    
    init() {
        loadFromPersistentStore()
    }
    
    private(set) var movies: [Movie] = []
    
    func createMovie(name: String, movieTitle: String) {
        let newMovie = Movie(name: name, movieTitle: movieTitle)
        movies.append(newMovie)
        saveToPersistentStore()
    }
    
    func delete(movie: Movie) {
        guard let index = movies.firstIndex(of: movie) else {return}
        movies.remove(at: index)
        saveToPersistentStore()
    }
    
    
    private var fileUrl: URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let fileName = "movies.json"
         let finalLocation = documentsDirectory.appendingPathComponent(fileName)
        return finalLocation
    }
    
    
    func saveToPersistentStore(){
        //where to save to?
        guard let url = fileUrl else {return}
        //needs to convert to be data, Its a Movie right now.
        let encoder = JSONEncoder()//PropertyListEncoder()
        //what are we encoding? All of our Movies.
        //How? we have to try.
        do {
            let data = try encoder.encode(movies)
            //need to write it.
            try data.write(to: url)
        } catch {
            print(error)
        }
        
    }
    
    func loadFromPersistentStore(){
        //get data from file first
        guard let url = fileUrl, FileManager.default.fileExists(atPath: url.path) else {return}
        
        do {
            
            let data = try Data(contentsOf: url)
            //asign it to movies array. Decode first
            let decoder = JSONDecoder()//PropertyListDecoder()
            //decode an array os Stars
            movies = try decoder.decode([Movie].self, from: data)
        } catch {
            print(error)
        }
        
    }
    
}
