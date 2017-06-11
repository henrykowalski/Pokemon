//
//  PokeAnnotation.swift
//  Pokemon
//
//  Created by Andrzej Palec on 11/06/2017.
//  Copyright © 2017 Andrzej Palec. All rights reserved.
//

import UIKit
import MapKit

class PokeAnnotation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var pokemon: Pokemon
    
    init(coord: CLLocationCoordinate2D, pokemon: Pokemon) {
        self.coordinate = coord
        self.pokemon = pokemon
    }
}
