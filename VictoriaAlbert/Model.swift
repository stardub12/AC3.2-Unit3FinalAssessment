//
//  Model.swift
//  VictoriaAlbert
//
//  Created by Simone Grant on 11/10/16.
//  Copyright © 2016 Simone Grant. All rights reserved.
//

import Foundation

//Did not use this file

class Records {
    let object: String
    let date: String
    let place: String
    
    init(object: String, date: String, place: String) {
        self.object = object
        self.date = date
        self.place = place
    }
   
//    convenience init(ringRecords: [String: Any]) {
//        guard let dict = ringRecords["fields"] as? [String: AnyObject] else {
//            print("Could not access dictionary")
//            
//        }
//    }
//    
    
  
//    
//    init(newDict: [String: AnyObject]) {
//        self.object = (newDict["object"] as? String)!
//        self.date = (newDict["year_start"] as? String)!
//        self.place = (newDict["place"] as? String)!
//    }
//    
    static func returnRingData(from data: Data) -> [Records]? {
        
        var records = [Records]()
        
        do {
            let jsonRecords: Any = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let recordsArray = jsonRecords as? [String: Any] else { return nil }
            guard let recordsDict = recordsArray["records"] as? [String: Any] else { return nil }
            guard let newDict = recordsDict["fields"] as? [[String: Any]] else {
                return nil
            }
           
            newDict.forEach({ (recordObject) in
                guard let year = recordObject["year_start"],
                let object = recordObject["object"] as? String,
                    let place = recordObject["place"] as? String else {
                        return
                }
                let recordDetails = Records(object: object, date: year as! String, place: place)
                records.append(recordDetails)
            })
            
        } catch let error as NSError {
            print("Data parsing error: \(error.localizedDescription)")
        }
        return nil
    }
}
