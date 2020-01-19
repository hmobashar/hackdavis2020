//
//  SymptomCell.swift
//  Tend
//
//  Created by Katie Kwak on 1/19/20.
//  Copyright © 2020 hackdavis2020. All rights reserved.
//

import Foundation
import Firebase

struct CellModel {
    let name: String
}

class SymptomCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    

    @IBOutlet weak var name: UILabel!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
    
    public func configure(with model: CellModel) {
        name.text = model.name
    }

}
