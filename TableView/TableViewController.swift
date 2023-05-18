//
//  TableViewController.swift
//  TableView
//
//  Created by 903-18i on 16.05.2023.
//

import UIKit

class TableViewController: UITableViewController {

    
    //var array = ["1","2","3"]
    
    //var names = ["April","John", "Clara"]
    //var surnames = ["Kim", "Smith", "Will"]
    //var images = ["AprilKim", "JohnSmith", "ClaraWill"]
    
    var movies = [Movie(name: "Inception", imdb: 8.8, imageAddress: "inception", desc: "A thief who steals corporate                      secrets through the use of dream-sharing technology is given the inverse task of planting an idea                   into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.", year:               2010),
                  Movie(name: "Interstellar", imdb: 8.6, imageAddress: "interstellar", desc: "When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.", year: 2014),
                  Movie(name: "The Prestige", imdb: 8.5, imageAddress: "prestige", desc: "After a tragic accident, two stage magicians in 1890s London engage in a battle to create the ultimate illusion while sacrificing everything they have to outwit each other.", year: 2006),
                  Movie(name: "Tenet", imdb: 7.3, imageAddress: "tenet", desc: "Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.", year: 2020),
                  Movie(name: "The Gentlemen", imdb: 7.8, imageAddress: "gentlemen", desc: "An American expat tries to sell off his highly profitable marijuana empire in London, triggering plots, schemes, bribery and blackmail in an attempt to steal his domain out from under him.", year: 2019)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = nil
        
        if indexPath.row % 2 == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        }
        

        // Configure the cell...
        
        let name = cell!.viewWithTag(1000) as! UILabel
        name.text = movies[indexPath.row].name
        
        let imdb = cell!.viewWithTag(1001) as! UILabel
        imdb.text = "IMDB: \(movies[indexPath.row].imdb)"
        
        let image = cell!.viewWithTag(1002) as! UIImageView
        image.image = UIImage(named: movies[indexPath.row].imageAddress)

        return cell!
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 149
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "viewController") as! ViewController
        
        viewController.movie = movies[indexPath.row]
        
        navigationController?.show(viewController, sender: self)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            movies.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    @IBAction func addContact(_ sender: Any) {
        movies.append(Movie(name: "Spider-Man:Across the Spider-Verse", imdb: 0.0, imageAddress: "spiderman", desc: "Miles Morales catapults across the Multiverse, where he encounters a team of Spider-People charged with protecting its very existence. When the heroes clash on how to handle a new threat, Miles must redefine what it means to be a hero.", year: 2023))

        tableView.reloadData()
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
