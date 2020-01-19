//
//  TodayChartsView.swift
//  Tend
//
//  Created by Hajra Mobashar on 1/19/20.
//  Copyright © 2020 hackdavis2020. All rights reserved.
//

import UIKit
import Charts

class TodayChartsView: UIViewController {

    @IBOutlet weak var barView: BarChartView!
    var datas = ["Morning", "Afternoon", "Evening"]
    var vals = [0.5,2.0,1.0]
    weak var axisFormatDelegate: IAxisValueFormatter?
    let formato:BarChartFormatter = BarChartFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setChart(dataPoints: datas, values: vals)
        //barView.xAxis.drawAxisLineEnabled = false
        barView.xAxis.labelPosition = .bottom
        barView.xAxis.drawGridLinesEnabled = false
        barView.xAxis.labelCount = 3
        barView.legend.enabled = false
        barView.fitBars = true
        // Do any additional setup after loading the view.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
