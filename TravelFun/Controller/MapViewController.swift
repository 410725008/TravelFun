//
//  MapViewController.swift
//  FoodPin
//
//  Created by NDHU_CSIE on 2020/12/3.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    var restaurant: TravelDataMO!
    
    let locationManager = CLLocationManager()
    var currentLocation: MKUserLocation?
    var targetPlacemark: CLPlacemark?
    
    var currentTransportType = MKDirectionsTransportType.automobile
    var currentRoute: MKRoute?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Request for a user's authorization for location services
        locationManager.requestWhenInUseAuthorization()
        let status = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
        //locationManager.delegate = self
        
        // Hide the segmented control by default and register the event
        segmentedControl.isHidden = true
        segmentedControl.addTarget(self, action: #selector(showDirection), for: .valueChanged)
        
        // Configure map view
        mapView.delegate = self
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
        
        // Convert address to coordinate and annotate it on map
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.address ?? "", completionHandler: { placemarks, error in
            if let error = error {
                print(error)
                return
            }
            
            if let placemarks = placemarks {
                // Get the first placemark
                let placemark = placemarks[0]
                self.targetPlacemark = placemark
                
                // Add annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.name
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    // Display the annotation
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
            
        })
    }
    
    
    // MARK: - Map View Delegate methods
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyMarker"
        
        if annotation.isKind(of: MKUserLocation.self) {  //unchanged to the marker of the current location
            return nil
        }
        
        // Reuse the annotation if possible
        var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        //annotationView?.glyphText = "😋"
        // annotationView?.markerTintColor = UIColor.orange
        
        
        let leftIconView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 53, height: 53))
        
        if restaurant.image == "UpDaTeImAgEfRoMmObIlE"{
            if let restaurantImage = self.restaurant.image2 {
                leftIconView.image = UIImage(data: restaurantImage as Data)
            }
        }else if restaurant.image == "foodpin-logo"{
            leftIconView.image = UIImage(named: "foodpin-logo")
        }else if let imageAddress = restaurant.image {
            //產生url
            if let imageUrl = URL(string: imageAddress){
                DispatchQueue.global().async {
                    do{
                        //利用Data來產生下載內容
                        let imageData = try Data(contentsOf: imageUrl)
                        let downLoadImage = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            leftIconView.image = downLoadImage
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }}else{
                leftIconView.image = UIImage(named: "foodpin-logo")
            }
        annotationView?.leftCalloutAccessoryView = leftIconView
        annotationView?.rightCalloutAccessoryView = UIButton(type: UIButton.ButtonType.detailDisclosure) //show routing steps
        
        return annotationView
    }
    
    
    // for rending the routing path
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = (currentTransportType == .automobile) ? UIColor.blue : UIColor.orange
        renderer.lineWidth = 3.0
        
        return renderer
    }
    
    // click handler for the rightCalloutAccessory on the annotation
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
          
          performSegue(withIdentifier: "showSteps", sender: view)
      }
    
    
    @IBAction func showDirection(_ sender: Any) {
        
        var currentPlacemark: CLPlacemark?
        //get the current location
        //locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
//        locationManager.requestLocation()  //request once
        
        guard let currentLocation = currentLocation?.location,
              let targetPlacemark = targetPlacemark else {
            return
        }
        
        switch segmentedControl.selectedSegmentIndex {
        case 0: currentTransportType = .automobile
        case 1: currentTransportType = .walking
        default: break
        }
        
        segmentedControl.isHidden = false
        
        let directionRequest = MKDirections.Request()
        
        // Set the source and destination of the route
        //directionRequest.source = MKMapItem.forCurrentLocation()
        //translate the current cooridinate to the address
        CLGeocoder().reverseGeocodeLocation(currentLocation) { places, _ in
            if let firstPlace = places?.first {
                currentPlacemark = firstPlace
                
                let sourcePlacemark = MKPlacemark(placemark: currentPlacemark!)
                directionRequest.source = MKMapItem(placemark: sourcePlacemark)
                let destinationPlacemark = MKPlacemark(placemark: targetPlacemark)
                directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
                directionRequest.transportType = self.currentTransportType
                
                // Calculate the direction
                let directions = MKDirections(request: directionRequest)
                
                directions.calculate { (routeResponse, routeError) -> Void in
                    
                    guard let routeResponse = routeResponse else {
                        if let routeError = routeError {
                            print("Error: \(routeError)")
                        }
                        return
                    }
                    
                    let route = routeResponse.routes[0]
                    self.currentRoute = route
                    self.mapView.removeOverlays(self.mapView.overlays)
                    self.mapView.addOverlay(route.polyline, level: MKOverlayLevel.aboveRoads)
                    
                    let rect = route.polyline.boundingMapRect
                    self.mapView.setRegion(MKCoordinateRegion.init(rect), animated: true)
                }
            }
        }
        
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        currentLocation = userLocation
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          // Get the new view controller using segue.destinationViewController.
          // Pass the selected object to the new view controller.
          if segue.identifier == "showSteps" {
              let routeTableViewController = segue.destination as! RouteTableViewController
              if let steps = currentRoute?.steps {
                  routeTableViewController.routeSteps = steps
              }
          }
      }
      
    
    // MARK: - Location Manager Delegate methods
    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("Error happen: \(error.localizedDescription)")
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//            //translate the cooridinate to the address
//            CLGeocoder().reverseGeocodeLocation(location) { places, _ in
//                if let firstPlace = places?.first {
//                    self.currentPlacemark = firstPlace
//                }
//            }
//        }
//    }
    
}
