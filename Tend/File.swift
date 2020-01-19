//
//  File.swift
//  
//
//  Created by Hajra Mobashar on 1/19/20.
//

import Foundation

public class BarChartFormatter: NSObject, IAxisValueFormatter {
    var matches: [String]! = ["Lost", "Drawn", "Won"]

    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return matches[Int(value)]
    }

    public func setValues(values: [String]){
        self.matches = values
    }


}
