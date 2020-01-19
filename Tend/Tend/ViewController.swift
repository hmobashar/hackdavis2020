//
//  ViewController.swift
//  Tend
//
//  Created by Hajra Mobashar on 1/18/20.
//  Copyright © 2020 hackdavis2020. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var loadingImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadingImage.isHidden = false
        loadingImage.loadGif(name: "happyGif")
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func behaviorLogButton(_ sender: Any) {
        loadingImage.loadGif(name: "sadGif")
    }

}

