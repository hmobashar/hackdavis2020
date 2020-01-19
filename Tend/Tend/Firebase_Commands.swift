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

let rootRef = Database.database().reference()

// --------------- helper METHODS ---------------

func serializeMedication(medication: Medication) -> [String: Any] {
    let med_info : [String: Any] = [
        "name": medication.name,
        "dosage": medication.dosage,
        "num_taken": medication.num_taken,
        "timestamps": medication.timestamps,
    ]

    return med_info
} // serializeMedication(): Convert Medication object to dictionary



func serializeSymptom(symptom: Symptom) -> [String : Any] {
    let symptom_info : [String : Any] = [
        "name": symptom.name,
        "occurred": symptom.occurred
    ]
    return symptom_info
} // serializeSymptom(): format data for database



// --------------- POST METHODS ---------------

func uploadMedication(medication: Medication) {
    let medication_key = rootRef.child("user").child("medications")
    medication_key.child(medication.name).setValue(medication.dosage)
} // uploadMedication(): Add to list/summary of meds in Firebase



func uploadSymptom(symptom: Symptom) {
    let symptom_key = rootRef.child("user").child("symptoms")
    symptom_key.child(symptom.name).setValue(symptom.occurred)
} // uploadSymptom(): Add to list/summary of symptoms in Firebase



func logMedication(med: Medication, date: String) {
    let date_key = rootRef.child("user").child("history").child(date)
    date_key.child("medications").child(med.name).setValue(serializeMedication(medication: med))
} // logMedication(): Add med & #taken under a date entry in Firebase



func logSymptom(sym: Symptom, date: String) {
    let date_key = rootRef.child("user").child("history").child(date)
    date_key.child("symptoms").child(sym.name).setValue(serializeSymptom(symptom: sym))
} // logSymptom(): Add symptom & T/F under a date entry in Firebase



// --------------- GET METHODS ---------------

func getMedication(date: String) -> [Medication] {
    var med_list = [Medication]()
    
    let med_key = rootRef.child("user").child("history").child(date).child("medications")
    
    med_key.observe(.value, with: { snapshot in
        guard let medications = snapshot.children.allObjects as? [DataSnapshot] else { return }
    
        for med in medications {
            // extract values
            let title = med.childSnapshot(forPath: "name").value as? String
            let dsge = med.childSnapshot(forPath: "dosage").value as? Double
            let med_count = med.childSnapshot(forPath: "num_taken").value as? Int
            let times = med.childSnapshot(forPath: "timestamps").value as? [Int: String]
            
            // unwrap optionals
            let name = title ?? ""
            let dosage = dsge ?? 0.0
            let num_taken = med_count ?? 0
            let timestamps = times ?? [Int: String]()
            
            let temp_med = Medication(name: name, dosage: dosage)
            temp_med.num_taken = num_taken
            temp_med.timestamps = timestamps
            
            med_list.append(temp_med)
        } // extract info for each medication & create Medication object
        
    }) // observe all medications taken for specific date
    
    return med_list
} // getMedication() : Return array of medications for specific date, from Firebase



func getSymptom(date: String) -> [Symptom] {
    var sym_list = [Symptom]()

    let sym_key = rootRef.child("user").child("history").child(date).child("symptoms")

    sym_key.observe(.value, with: { snapshot in 
        guard let symptoms = snapshot.children.allObjects as? [DataSnapshot] else { return }
        for sym in symptoms {
            // extract values
            let wrapped_name = sym.childSnapshot(forPath: "name").value as? String
            let wrapped_occurred = sym.childSnapshot(forPath: "occurred").value as? Bool

            // unwrap values(optionals)
            let name = wrapped_name ?? ""
            let occurred = wrapped_occurred ?? false

            var symptom = Symptom(name: name, occur: occurred)
            sym_list.append(symptom)
        } // iterates through all items in symptoms field
    })
    return sym_list
} // getSymptom() : Read symptom entry from Firebase into Symptom object
