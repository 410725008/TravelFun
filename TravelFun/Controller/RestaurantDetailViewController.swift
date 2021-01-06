//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by NDHU_CSIE on 2020/11/5.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: RestaurantDetailHeaderView!
    
    var restaurant: TravelDataMO!
    
    // MARK: - Table view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        // Configure header view
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.distric
        if restaurant.image == "UpDaTeImAgEfRoMmObIlE"{
            if let restaurantImage = self.restaurant.image2 {
                headerView.headerImageView.image = UIImage(data: restaurantImage as Data)
            }
        }else if restaurant.image == "foodpin-logo"{
            headerView.headerImageView.image = UIImage(named: "foodpin-logo")
        }else if let imageAddress = restaurant.image {
            //產生url
            if let imageUrl = URL(string: imageAddress){
                DispatchQueue.global().async {
                    do{
                        //利用Data來產生下載內容
                        let imageData = try Data(contentsOf: imageUrl)
                        let downLoadImage = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            self.headerView.headerImageView.image = downLoadImage
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }}else{
                headerView.headerImageView.image = UIImage(named: "foodpin-logo")
            }
        headerView.heartImageView.isHidden = (restaurant.isVisited) ? false : true
        if let rating =  restaurant.rating {
            headerView.ratingImageView.image = UIImage(named: rating)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            //        cell.iconImageView.image = UIImage(systemName: "phone")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            cell.iconImageView.image = UIImage(named: "phone")
            cell.shortTextLabel.text = restaurant.tel
            if restaurant.tel == ""{
                cell.shortTextLabel.text = "--No Phone Number--"
            }
            cell.selectionStyle = .none
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            //        cell.iconImageView.image = UIImage(systemName: "map")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            cell.iconImageView.image = UIImage(named: "map")
            cell.shortTextLabel.text = restaurant.address
            if restaurant.address == ""{
                cell.shortTextLabel.text = "--No Address--"
            }
            cell.selectionStyle = .none
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            //        cell.iconImageView.image = UIImage(systemName: "map")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            cell.iconImageView.image = UIImage(named: "store")
            cell.shortTextLabel.text = restaurant.url
            if restaurant.url == ""{
                cell.shortTextLabel.text = "--No Website URL--"
            }
            cell.selectionStyle = .none
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            //        cell.iconImageView.image = UIImage(systemName: "map")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            cell.iconImageView.image = UIImage(named: "facebook")
            cell.shortTextLabel.text = restaurant.facebook
            if restaurant.facebook == ""{
                cell.shortTextLabel.text = "--No Facebook--"
            }
            cell.selectionStyle = .none
            
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            //        cell.iconImageView.image = UIImage(systemName: "map")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            cell.iconImageView.image = UIImage(named: "direction")
            cell.shortTextLabel.text = restaurant.email
            if restaurant.email == ""{
                cell.shortTextLabel.text = "--No Email--"
            }
            cell.selectionStyle = .none
            
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            //        cell.iconImageView.image = UIImage(systemName: "map")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            cell.iconImageView.image = UIImage(named: "store")
            cell.shortTextLabel.text = restaurant.official_site
            if restaurant.official_site == ""{
                cell.shortTextLabel.text = "--No Official Site--"
            }
            cell.selectionStyle = .none
            
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            //        cell.iconImageView.image = UIImage(systemName: "map")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            cell.iconImageView.image = UIImage(named: "direction")
            cell.shortTextLabel.text = restaurant.open_time
            if restaurant.official_site == ""{
                cell.shortTextLabel.text = "--No Open Time--"
            }
            cell.selectionStyle = .none
            
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            //        cell.iconImageView.image = UIImage(systemName: "map")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            cell.iconImageView.image = UIImage(named: "map")
            cell.shortTextLabel.text = String(restaurant.nlat) + " , " + String(restaurant.elong)
            cell.selectionStyle = .none
            
            return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
            cell.descriptionLabel.text = restaurant.introduction
            cell.selectionStyle = .none
            
            return cell
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailSeparatorCell.self), for: indexPath) as! RestaurantDetailSeparatorCell
            cell.titleLabel.text = "HOW TO GET HERE"
            cell.selectionStyle = .none
            
            return cell
        case 10:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
            cell.selectionStyle = .none
            if restaurant.nlat != 0.0 {
                cell.configure(location: String(restaurant.nlat) + " , " + String(restaurant.elong))
            }else if let restaurantLocation = restaurant.address{
                cell.configure(location: restaurantLocation)
            }
            
            return cell
        case 11:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
            cell.descriptionLabel.text = restaurant.modified
            cell.selectionStyle = .none
            
            return cell
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let destinationController = segue.destination as! MapViewController
            destinationController.restaurant = restaurant
        }
        else if segue.identifier == "showReview" {
            let destinationController = segue.destination as! ReviewViewController
            destinationController.restaurant = restaurant
        }
    }
    
    @IBAction func close(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func rateRestaurant(segue: UIStoryboardSegue) {
        if let rating = segue.identifier {
            self.restaurant.rating = rating
            self.headerView.ratingImageView.image = UIImage(named: rating)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
