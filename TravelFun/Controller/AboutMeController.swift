//
//  AboutMeController.swift
//  FoodPin
//
//  Created by NDHU_CSIE on 2020/12/24.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit
import SafariServices
import CoreData
class AboutMeController: UITableViewController , NSFetchedResultsControllerDelegate{
    
    var sectionContent = [
        [ "https://www.apple.com/ios/app-store/",                     "http://www.appcoda.com/contact"
        ],
        [
            "https://twitter.com/appcodamobile",
            "https://facebook.com/appcodamobile",
            "https://www.instagram.com/appcodadotcom"
        ]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let link = sectionContent[indexPath.section][indexPath.row]
        if let url = URL(string: link) {
            let safariController = SFSafariViewController(url: url)
            present(safariController, animated: true, completion: nil)
        }
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
    @IBAction func ClearAllDATA(){
        getPageCount = 0
        deleteAllRecords()
    }
    
    func deleteAllRecords() {
        //delete all data
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "TravelData")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            
            do {
                try context.execute(deleteRequest)
                try context.save()
            } catch {
                print ("There was an error")
            }
            
        }
    }
    
}


