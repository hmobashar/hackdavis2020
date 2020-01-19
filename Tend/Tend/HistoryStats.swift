//
//  HistoryStats.swift
//  Tend
//
//  Created by Hajra Mobashar on 1/18/20.
//  Copyright © 2020 hackdavis2020. All rights reserved.
//

import UIKit
import Charts

class HistoryStats: UIViewController {

    @IBOutlet weak var barView: BarChartView!
    var data = ["morning", "afternoon", "evening"]
    var vals = [0.0,2.0,1.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setChart(dataPoints: data, values: vals)

        // Do any additional setup after loading the view.
    }
    
    func setChart(dataPoints: [String], values: [Double]) {

        barView.noDataText = "You need to provide data for the chart."

        var dataEntries: [BarChartDataEntry] = Array()
        var counter = 0.0

        for i in 0..<dataPoints.count {
            counter += 1.0
            let dataEntry = BarChartDataEntry(x: values[i], y: counter)
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Time")
        let chartData = BarChartData()
        chartData.addDataSet(chartDataSet)
        barView.data = chartData

    }

}
