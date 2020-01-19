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

    // @IBOutlet weak var pieChart: PieChartView!
    
    // @IBOutlet weak var iosStepper: UIStepper!
    // @IBOutlet weak var macStepper: UIStepper!
    
    // var iosDataEntry = PieChartDataEntry(value: 0)
    // var macDataEntry = PieChartDataEntry(value: 0)
    
    // var numberOfDownloadsDataEntries = [PieChartDataEntry]()
    @IBOutlet weak var loadingImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingImage.isHidden = false
        loadingImage.loadGif(name: "happyGif")
        // Do any additional setup after loading the view.
        
        // pieChart.chartDescription?.text = ""
        
        // iosDataEntry.value = iosStepper.value
        // iosDataEntry.label = "iOS"
        
        // macDataEntry.value = macStepper.value
        // macDataEntry.label = "macOS"
        
        // numberOfDownloadsDataEntries = [iosDataEntry, macDataEntry]
        
        // updateChartData()



        // FIXME: Test Functions for Firebase
        testWriteDatabase()
        testReadDatabase()


    }
    
    // @IBAction func changeiOS(_ sender: UIStepper) {
    //   iosDataEntry.value = sender.value
    //   updateChartData()
    // }
    
    // IBAction func changeMac(_ sender: UIStepper) {
    //   macDataEntry.value = sender.value
    //   updateChartData()
    // }
    
    func updateChartData() {
        // let chartDataSet = PieChartDataSet(values: numberOfDownloadsDataEntries, label: nil)
        // let chartData = PieChartData(dataSet: chartDataSet)
        
        // let colors = [UIColor(named:"iosColor"), UIColor(named:"macColor")]
        // chartDataSet.colors = colors as! [NSUIColor]
        
        // pieChart.data = chartData
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    // TODO: TEST Write Database
    func testWriteDatabase() {

        // TODO: Test Medication
        let testMed = Medication(name: "Prozac", dosage: 103.56)
        uploadMedication(testMed)
        logMedication(med: testMed, date: "01/18/2020")

        // TODO: Test Symptom
        let testSymptom = Symptom(name: "tummy-ache", occur: true)
        uploadSymptom(symptom: testSymptom)
        logSymptom(sym: testSymptom, date: "01/18/2020")

        // TODO: Test Meal Logging
        var medArr = [Medication]()
        let med1 = Medication(name: "Laugh-gas", dosage: 23.4)
        let med2 = Medication(name: "Mean Girls", dosage: 0.0)
        medArr.append(med1)
        medArr.append(med2)
        var symArr = [Symptom]()
        let sym1 = Symptom(name: "Hangry", occur: true)
        symArr.append(sym1)
        let testMeal = Meal(name: "Pasta", med: medArr, sym: symArr,
            description: "Pasta was too good for me!")
        logMeal(testMeal, "01/18/2020")

    }



    // TODO: Test Read Database
    func testReadDatabase() {
        
        // test Medication
        var med = getMedication("01/18/2020")
        for med_item in med {
            print(med)
        }

        // test Symptom
        var sym = getSymptom("01/18/2020")
        for sym_item in sym {
            print(sym_item)
        }

        // test Meal
        var meal = getMeal("01/18/2020")
        for meal_item in meal {
            print(meal_item)
        }

    }

}

