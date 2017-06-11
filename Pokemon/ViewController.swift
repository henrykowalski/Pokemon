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
            
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (timer) in
                // Spawn a Pokemon
                
                // anno stands for annotation
                
                if let coord = self.manager.location?.coordinate {
                    let anno = MKPointAnnotation()
                    anno.coordinate = coord
                    let randoLat = (Double(arc4random_uniform(200)) - 100.0) / 50000.0
                    let randoLon = (Double(arc4random_uniform(200)) - 100.0) / 50000.0
                    anno.coordinate.latitude += randoLat
                    anno.coordinate.longitude += randoLon
                    
                    self.mapView.addAnnotation(anno)
                }
                
            })
            
        } else {
            manager.requestWhenInUseAuthorization()
        }
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if updateCount < 3 {
            
            let region = MKCoordinateRegionMakeWithDistance(manager.location!.coordinate, 200, 200)
            
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
            
            let region = MKCoordinateRegionMakeWithDistance(coord, 200, 200)
            
            mapView.setRegion(region, animated: true)
        }
    }
    
}

