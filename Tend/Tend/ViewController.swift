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

}

