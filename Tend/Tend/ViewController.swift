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
    @IBOutlet weak var dailyLog: UIView!
    @IBOutlet weak var logView: UIView!
    @IBOutlet weak var breakfastName: UILabel!
    @IBOutlet weak var lunchName: UILabel!
    @IBOutlet weak var dinnerName: UILabel!
    
    
    let formato:BarChartFormatter = BarChartFormatter()
    var data = ["Morning", "Afternoon", "Evening"]
    var someOtherDay = false
       var vals = [0.5,2.0,1.0]
    var vals2 = [1.0,1.0,0.0]

    override func viewDidLoad() {
        super.viewDidLoad()
        loadingImage.isHidden = false
        loadingImage.loadGif(name: "happyGif")
        barView.xAxis.drawAxisLineEnabled = false
        barView.xAxis.drawGridLinesEnabled = false
        barView.xAxis.labelCount = 3
        barView.legend.enabled = false
        setChart(dataPoints: data, values: vals)
        logView.isHidden = true
        
        if(someOtherDay){
            let meal = getMeal(date: "2020-01-22")
            breakfastName.text = "You had " + meal[0].meal_name
            lunchName.text = "You had " + meal[1].meal_name
            dinnerName.text = "You had " + meal[2].meal_name
        }
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
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "whatever")
        let chartData = BarChartData(dataSets: [chartDataSet])
        chartDataSet.colors = ChartColorTemplates.material()

        barView.data = chartData
    }

    @IBAction func closeLogs(_ sender: Any) {
        logView.isHidden = true
    }
    
    @IBAction func saveLogs(_ sender: Any) {
        logView.isHidden = true
    }
    
    @IBAction func behaviorLogButton(_ sender: Any) {
        //loadingImage.loadGif(name: "sadGif")
        logView.isHidden = false
    }

}

