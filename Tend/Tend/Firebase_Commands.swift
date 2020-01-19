//
//  Firebase_Commands.swift
//  Tend
//
//  Created by Katie Kwak on 1/18/20.
//  Copyright © 2020 hackdavis2020. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

// --------------- POST METHODS ---------------

func uploadMedication(medication: Medication) {
    
    
} // uploadMedication(): Add to list/summary of meds in Firebase



func uploadSymptom(symptom: Symptom) {
    
} // uploadSymptom(): Add to list/summary of symptoms in Firebase



func logMedication(medication: Medication) {
    
} // logMedication(): Add med & #taken under a date entry in Firebase



func logSymptom(symptom: Symptom) {
    
} // logSymptom(): Add symptom & T/F under a date entry in Firebase





// --------------- GET METHODS ---------------

func getMedication() -> Medication? {
    return nil // FIXME: remove (added to silence missing return error)
} // getMedication() : Read med entry from Firebase into Medication object



func getSymptom() -> Symptom? {
    return nil // FIXME: remove (added to silence missing return error)
} // getSymptom() : Read symptom entry from Firebase into Symptom object
