//
//  MainViewController.swift
//  TableViewApp
//
//  Created by Andrew Cheberyako on 05.03.2021.
//

import UIKit
import RealmSwift

class MainViewController: UITableViewController {


    var places: Results<Place>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        places = realm.objects(Place.self)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.isEmpty ? 0: places.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CastomTableViewCell

        let place = places[indexPath.row]

        cell.nameLabel?.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
        
        cell.imageOfPace.image = UIImage(data: place.imageData!)

        

        cell.imageOfPace?.layer.cornerRadius = cell.imageOfPace.frame.size.height / 2
        cell.imageOfPace?.clipsToBounds = true  // обрезка изображения по imageView


        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }

   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let newPlaceVC = segue.source as? NewPlaceTableViewController else {return}
        
        newPlaceVC.saveNewPlace()
        tableView.reloadData() // обновление таблицы
    }

}
