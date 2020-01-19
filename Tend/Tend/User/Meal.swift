//
//  Meal.swift
//  Tend
//
//  Created by Katie Kwak on 1/18/20.
//  Copyright © 2020 hackdavis2020. All rights reserved.
//

import Foundation

class Meal {
    var meal_name: String
    var medication: [Medication]
    var symptom: [Symptom]
    var food: String
    
    init(name: String, med: [Medication], sym: [Symptom], description: String) {
        self.meal_name = name
        self.medication = med
        self.symptom = sym
        self.food = description
    }

} // Meal: Track medication & symptoms associated w/ meals
