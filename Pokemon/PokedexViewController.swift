//
//  PokedexViewController.swift
//  Pokemon
//
//  Created by Andrzej Palec on 11/06/2017.
//  Copyright © 2017 Andrzej Palec. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func mapTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
