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
    
    let formato:BarChartFormatter = BarChartFormatter()
    var data = ["Morning", "Afternoon", "Evening"]
       var vals = [0.5,2.0,1.0]

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

