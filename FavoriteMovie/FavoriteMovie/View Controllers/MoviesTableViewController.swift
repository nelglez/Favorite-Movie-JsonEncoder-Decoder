//
//  MoviesTableViewController.swift
//  FavoriteMovie
//
//  Created by Nelson Gonzalez on 4/7/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    let moviesController = MoviesController()
    
 //   var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()

       
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
     //   loadMovies()
        tableView.reloadData()
    }
    
//    func loadMovies() {
//     movies = moviesController.loadFromPersistentStore()
//    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return moviesController.movies.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteMovieCell", for: indexPath)

        let movies = moviesController.movies[indexPath.row]
        cell.textLabel?.text = movies.movieTitle
        cell.detailTextLabel?.text = movies.name
        
        return cell
    }
   

   

   
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let movie = moviesController.movies[indexPath.row]
            
            moviesController.delete(movie: movie)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? AddMovieViewController
        destinationVC?.moviesController = moviesController
    }
    

}
