//
//  PlaceModel.swift
//  TableViewApp
//
//  Created by Andrew Cheberyako on 05.03.2021.
//

import RealmSwift

class Place: Object {
   
    @objc dynamic var name = ""
    @objc dynamic var location: String?
    @objc dynamic var type: String?
    @objc dynamic var imageData: Data?
    @objc dynamic var restaurantImage: String?
    

    
}
