//
//  BarChartFormatter.swift
//  Tend
//
//  Created by Hajra Mobashar on 1/19/20.
//  Copyright © 2020 hackdavis2020. All rights reserved.
//

import Foundation
import Charts

public class BarChartFormatter: NSObject, IAxisValueFormatter
{
    var matches: [String]! = ["Morning", "Afternoon", "Night"]

    public func stringForValue(_ value: Double, axis: AxisBase?) -> String{
        return matches[Int(value)]
    }

    public func setValues(values: [String])
    {
        self.matches = values
    }


}

