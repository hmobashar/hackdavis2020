//
//  Medication.swift
//  Tend
//
//  Created by Katie Kwak on 1/18/20.
//  Copyright © 2020 hackdavis2020. All rights reserved.
//

import Foundation

class Medication {
    
    var name: String
    var dosage: Double
    var num_taken: Int
    var timestamps = [Int: String]()
    
    init(name: String, dosage: Double) {
        self.name = name
        self.dosage = 0.0
        self.num_taken = 0
    }

} // Medication: track user's medication info