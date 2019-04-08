//
//  ViewController.swift
//  FavoriteMovie
//
//  Created by Nelson Gonzalez on 4/7/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var favoriteMovieTextField: UITextField!
    
    var moviesController: MoviesController?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addMovieButtonPressed(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty, let movieTitle = favoriteMovieTextField.text, !movieTitle.isEmpty else {return}
        
        moviesController?.createMovie(name: name, movieTitle: movieTitle)
        self.navigationController?.popViewController(animated: true)
    }
    
}

