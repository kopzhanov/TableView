//
//  ViewController.swift
//  TableView
//
//  Created by 903-18i on 16.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelName.text = movie.name
        
        labelIMDB.text = "IMDB: \(movie.imdb)"
        
        imageView.image = UIImage(named: movie.imageAddress)
        
        labelYear.text = "Year: \(movie.year)"
        
        labelDescription.text = movie.desc
        // Do any additional setup after loading the view.
    }
    
    var movie = Movie()
//    var name = ""
//    var surname = ""
//    var image = ""
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelIMDB: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var labelYear: UILabel!
    
    @IBOutlet weak var labelDescription: UILabel!
    
}
