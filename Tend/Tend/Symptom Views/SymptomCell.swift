//
//  SymptomCell.swift
//  Tend
//
//  Created by Katie Kwak on 1/19/20.
//  Copyright © 2020 hackdavis2020. All rights reserved.
//

import Foundation
import Firebase

class SymptomCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var name: UILabel!

    func setContact() {
            // set up image UI
            self.image.contentMode = .scaleAspectFill
            self.image.layer.cornerRadius = 40
            self.image.translatesAutoresizingMaskIntoConstraints = false
            self.image.clipsToBounds = true
            self.image.layer.cornerRadius = (self.image.frame.size.width ) / 2
            self.image.layer.borderWidth = 3.0
            self.image.layer.borderColor = UIColor.white.cgColor

            // assign data
            self.name.text = "Happy"
        }
}
