//
//  VATableViewController.swift
//  VictoriaAlbert
//
//  Created by Simone Grant on 11/10/16.
//  Copyright © 2016 Simone Grant. All rights reserved.
//

import UIKit

internal typealias JSON = [String: Any]

class VATableViewController: UITableViewController {
    
    var objectRecords = [AnyObject]()
    var records = [Records]()
    var ringTitle: String = ""
    var year: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        //define url
        let url = NSURL(string: "http://www.vam.ac.uk/api/json/museumobject/search?q=ring")
        //make a request
        let request = NSMutableURLRequest(url: url as! URL)
        //start data task
        URLSession.shared.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            
            //error handling
            if error != nil {
                print("Error: \(error)")
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? JSON
                
                //parsing json through a secure method that prevents crashes
                guard let parsedJSON = json else {
                    print("Error while parsing")
                    return
                }
                
                print(parsedJSON)
                
                
                guard let recordsJSON = parsedJSON["records"] else {
                    print("Error on records")
                    return
                }
                
                self.objectRecords = (recordsJSON as? [AnyObject])!
                //I'm stuck here. I am getting errors because of the json parsing as AnyObject which can't be turned to a dictionary.
                
                
                
//                func getValues() -> String {
//                    for x in self.objectRecords {
//                        let fieldDict = objectRecords["fields"] as? [String: Any]
//                        for (value, key) in fieldDict {
//                            if value == "object" {
//                                ringTitle = key
//                                return ringTitle
//                            }
//                            else if value == "start_year" {
//                             year = key
//                                return year
//                            }
//                        }
//                    }
//                }
                
                
                //refresh the data
                self.tableView.reloadData()
                
            } catch {
                print("Caught an error: \(error)")
            }
            }.resume()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objectRecords.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VATableViewCell
        
        //I'm unable to load the tableview because of the parsing errors
//        cell.ringTitle?.text = ringTitle
//        cell.yearLabel?.text = year
        
        cell.textLabel?.text = "test"
        
        
        
        /*
         //get URL 1 by 1 of every object to return image
         let imageURLString = objectRecords[indexPath.row]["image"] as! String
         //convert string to URL
         let imageURL = NSURL(string: imageURLString)
         //Loaded data to URL
         let imageData = NSData(contentsOf: imageURL! as URL)
         //Loaded data to image view
         cell.actorsImageView.image = UIImage(data: imageData as! Data)
        */
        
        return cell
    }

   /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "detailSegue" {
            
        }
    }
    */

}
