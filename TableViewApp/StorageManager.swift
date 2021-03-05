//
//  StorageManager.swift
//  TableViewApp
//
//  Created by Andrew Cheberyako on 05.03.2021.
//

import RealmSwift


let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ place: Place) {
        try! realm.write {
            realm.add(place)
        }
    }
}
