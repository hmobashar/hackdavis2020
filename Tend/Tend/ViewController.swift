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

    @IBOutlet weak var barView: BarChartView!
    @IBOutlet weak var loadingImage: UIImageView!
    
    var data = ["Morning", "Afternoon", "Evening"]
    var vals = [0.5,2.0,1.0]
    let formato:BarChartFormatter = BarChartFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadingImage.isHidden = false
        loadingImage.loadGif(name: "happyGif")
        barView.xAxis.drawAxisLineEnabled = false
        barView.xAxis.drawGridLinesEnabled = false
        barView.xAxis.labelCount = 3
        barView.legend.enabled = false
        setChart(dataPoints: data, values: vals)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     func setChart(dataPoints: [String], values: [Double]){
        
        formato.setValues(values: dataPoints)
        let xaxis:XAxis = XAxis()

        let _ : XAxis = self.barView.xAxis;
        barView.noDataText = "you need to provide some data for the chart."

        var dataEntries: [BarChartDataEntry] = Array()

        for i in 0..<dataPoints.count
        {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }

        xaxis.valueFormatter = formato
        barView.xAxis.valueFormatter = xaxis.valueFormatter
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Games Played")
        let chartData = BarChartData(dataSets: [chartDataSet])
        chartDataSet.colors = ChartColorTemplates.material()

        barView.data = chartData

    }

    
    @IBAction func behaviorLogButton(_ sender: Any) {
        loadingImage.loadGif(name: "sadGif")
    }
    
    func updateChartData() {
        // let chartDataSet = PieChartDataSet(values: numberOfDownloadsDataEntries, label: nil)
        // let chartData = PieChartData(dataSet: chartDataSet)
        
        // let colors = [UIColor(named:"iosColor"), UIColor(named:"macColor")]
        // chartDataSet.colors = colors as! [NSUIColor]
        
        // pieChart.data = chartData
    }

    // TODO: TEST Write Database
    func testWriteDatabase() {

        // TODO: Test Medication
        let testMed = Medication(name: "Prozac", dosage: 103.56)
        uploadMedication(medication: testMed)
        logMedication(med: testMed, date: "01-18-2020")

        // TODO: Test Symptom
        let testSymptom = Symptom(name: "tummy-ache", occur: true)
        uploadSymptom(symptom: testSymptom)
        logSymptom(sym: testSymptom, date: "01-18-2020")

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
        logMeal(meal: testMeal, date: "01-18-2020")

    }



    // TODO: Test Read Database
    func testReadDatabase() {
        
        // test Medication
        let med = getMedication(date: "01-18-2020")
        for med_item in med {
            print(med_item)
        }

        // test Symptom
        let sym = getSymptom(date: "01-18-2020")
        for sym_item in sym {
            print(sym_item)
        }

        // test Meal
        let meal = getMeal(date: "01-18-2020")
        for meal_item in meal {
            print(meal_item)
        }

    }

}

