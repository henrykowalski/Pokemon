//
//  ViewController.swift
//  Pokemon
//
//  Created by Andrzej Palec on 10/06/2017.
//  Copyright © 2017 Andrzej Palec. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            print("ready to go")
        mapView.showsUserLocation = true
            
            manager.startUpdatingLocation()
            
        } else {
        manager.requestWhenInUseAuthorization()
        }
        
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if updateCount < 3 {
        
        let region = MKCoordinateRegionMakeWithDistance(manager.location!.coordinate, 400, 400)
        
        mapView.setRegion(region, animated: false)
        updateCount += 1
        } else {
            manager.stopUpdatingLocation()
        }
    }
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    var updateCount = 0
    
    var manager = CLLocationManager()
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func centerTapped(_ sender: Any) {
        
        if let coord = manager.location?.coordinate {
        
        let region = MKCoordinateRegionMakeWithDistance(coord, 400, 400)
        
        mapView.setRegion(region, animated: true)
        }
    }

}

