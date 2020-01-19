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

    @IBOutlet weak var barView1: BarChartView!
    let days = ["Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"]
    let medications = [1.0, 2.0, 0.0, 3.0, 3.0, 2.0, 1.0]
    let symptoms = [1.0,2.0,2.0, 4.0, 4.0, 2.0, 1.0]
    
    weak var axisFormatDelegate: IAxisValueFormatter?
    let formato:BarChartFormatter = BarChartFormatter()
    
    @IBOutlet weak var pieChart: PieChartView!

    var iosDataEntry = PieChartDataEntry(value: 0, label: "Hydrocodone")
    var macDataEntry = PieChartDataEntry(value: 0, label: "Alprazolam")
    
    var numberOfDownloadsDataEntries = [PieChartDataEntry]()

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        barView1.xAxis.drawAxisLineEnabled = false
        barView1.xAxis.drawGridLinesEnabled = false
        barView1.xAxis.labelCount = 3
        barView1.legend.enabled = false
        barView1.fitBars = true
        */
        //barView1.delegate = self
        barView1.noDataText = "You need to provide data for the chart."
        barView1.backgroundColor = UIColor.white
        
        let legend = barView1.legend
        legend.enabled = true
        legend.horizontalAlignment = .right
        legend.verticalAlignment = .top
        legend.orientation = .vertical
        legend.drawInside = true
        legend.yOffset = 10.0;
        legend.xOffset = 10.0;
        legend.yEntrySpace = 0.0;
        
        let xaxis = barView1.xAxis
        xaxis.valueFormatter = axisFormatDelegate
        xaxis.drawGridLinesEnabled = true
        xaxis.labelPosition = .bottom
        xaxis.centerAxisLabelsEnabled = true
        xaxis.valueFormatter = IndexAxisValueFormatter(values:self.days)
        xaxis.granularity = 1
        
        let leftAxisFormatter = NumberFormatter()
        leftAxisFormatter.maximumFractionDigits = 1
        
        let yaxis = barView1.leftAxis
        yaxis.spaceTop = 0.35
        yaxis.axisMinimum = 0
        yaxis.drawGridLinesEnabled = false
        
        barView1.rightAxis.enabled = false
        
        setChart()
        // Do any additional setup after loading the view.
        
        pieChart.chartDescription?.text = ""
        pieChart.drawEntryLabelsEnabled = false
        pieChart.legend.formSize = 15
        
        let legendp = pieChart.legend
        legendp.font = UIFont(name: "Verdana", size: 14.0)!
        iosDataEntry.value = iosDataEntry.value + 1
        //iosDataEntry.label = "H"
        
        macDataEntry.value = macDataEntry.value + 2
        //macDataEntry.label = "A"
        
        
        
        numberOfDownloadsDataEntries = [iosDataEntry, macDataEntry]
        
        updateChartData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setChart() {
        barView1.noDataText = "You need to provide data for the chart."
        var dataEntries: [BarChartDataEntry] = []
        var dataEntries1: [BarChartDataEntry] = []
        
        for i in 0..<self.days.count {
            
            let dataEntry = BarChartDataEntry(x: Double(i), y: self.medications[i])
            dataEntries.append(dataEntry)
            
            let dataEntry1 = BarChartDataEntry(x: Double(i), y: self.symptoms[i])
            dataEntries1.append(dataEntry1)
            
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Medications")
        let chartDataSet1 = BarChartDataSet(entries: dataEntries1, label: "Symptoms")
        
        let dataSets: [BarChartDataSet] = [chartDataSet, chartDataSet1]
        chartDataSet.colors = [UIColor(red: 155/255, green: 102/255, blue: 240/255, alpha: 1)]
        chartDataSet1.colors = [UIColor(red: 102/255, green: 191/255, blue: 255/255, alpha: 1)]
        
        let chartData = BarChartData(dataSets: dataSets)
        
        let groupSpace = 0.3
        let barSpace = 0.05
        let barWidth = 0.3
        
        let groupCount = self.days.count
        let startYear = 0
        
        chartData.barWidth = barWidth;
        barView1.xAxis.axisMinimum = Double(startYear)
        let gg = chartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace)
        barView1.xAxis.axisMaximum = Double(startYear) + gg * Double(groupCount)
        
        chartData.groupBars(fromX: Double(startYear), groupSpace: groupSpace, barSpace: barSpace)
        barView1.notifyDataSetChanged()
        
        barView1.data = chartData
        
        barView1.animate(xAxisDuration: 1.5, yAxisDuration: 1.5, easingOption: .linear)
    }

    func updateChartData() {
        let chartDataSet = PieChartDataSet(entries: numberOfDownloadsDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(named:"iosColor"), UIColor(named:"macColor")]
        chartDataSet.colors = colors as! [NSUIColor]
        
        pieChart.data = chartData
    }
    
}
