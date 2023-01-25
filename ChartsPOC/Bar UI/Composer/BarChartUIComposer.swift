//
//  BarChartUIComposer.swift
//  ChartsPOC
//
//  Created by Karthik K Manoj on 24/01/23.
//

import Foundation
import UIKit
import Charts


final class BarChartUIComposer {
    
    private init() {}
    
    static func makeBarChartViewController() -> BarChartViewController {
        let inMemoryBarChartLoader = InMemoryBarChartLoader()
        let barChartView = BarChartView()
        let adapter = BarChartAdapter(chartView: barChartView)
        let barChartViewController = BarChartViewController(
            barChartView: barChartView,
            barChartLoader: inMemoryBarChartLoader,
            onLoad: adapter.configureBarChartView(_:))
        return barChartViewController
    }
}

class BarChartAdapter {
    private let chartView: BarChartView
    
    init(chartView: BarChartView) {
        self.chartView = chartView
    }
    
    func configureBarChartView(_ barItems: [Bar]) {
        chartView.xAxis.labelPosition = .bottom
        chartView.leftAxis.axisMinimum = 0

        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.rightAxis.drawAxisLineEnabled = false
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.pinchZoomEnabled = false
        chartView.legend.enabled = false
        chartView.drawValueAboveBarEnabled = false
        chartView.rightAxis.drawLabelsEnabled = false
        chartView.leftAxis.drawLabelsEnabled = false

        chartView.drawGridBackgroundEnabled = false
        chartView.drawBordersEnabled = false
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.rightAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.doubleTapToZoomEnabled = false

        let entry1 = BarChartDataEntry(x: 1, yValues: getYValueFor(barItem: barItems[0]))
        let set = BarChartDataSet(entries: [entry1], label: "")
        set.drawIconsEnabled = false
        set.drawValuesEnabled = false
        set.highlightEnabled = false
        set.colors = barItems[0].category.map { $0.color }

        let entry2 = BarChartDataEntry(x: 2, yValues: getYValueFor(barItem: barItems[1]))
        let set2 = BarChartDataSet(entries: [entry2])
        set2.drawIconsEnabled = false
        set2.drawValuesEnabled = false
        set2.highlightEnabled = false
        set2.colors = barItems[1].category.map { $0.color }

        
        let entry3 = BarChartDataEntry(x: 3, yValues: getYValueFor(barItem: barItems[2]))
        let set3 = BarChartDataSet(entries: [entry3])
        set3.drawIconsEnabled = false
        set3.drawValuesEnabled = false
        set3.highlightEnabled = false
        set3.colors = barItems[2].category.map { $0.color }
        
        let entry4 = BarChartDataEntry(x: 4, yValues: getYValueFor(barItem: barItems[3]))
        let set4 = BarChartDataSet(entries: [entry4], label: "")
        set4.drawIconsEnabled = false
        set4.drawValuesEnabled = false
        set4.highlightEnabled = false
        set4.colors = barItems[3].category.map { $0.color }

        let entry5 = BarChartDataEntry(x: 5, yValues: getYValueFor(barItem: barItems[4]))
        let set5 = BarChartDataSet(entries: [entry5], label: "")
        set5.drawIconsEnabled = false
        set5.drawValuesEnabled = false
        set5.highlightEnabled = false
        set5.colors = barItems[4].category.map { $0.color }
        
        let entry6 = BarChartDataEntry(x: 6, yValues: getYValueFor(barItem: barItems[5]))
        let set6 = BarChartDataSet(entries: [entry6], label: "")
        set6.drawIconsEnabled = false
        set6.drawValuesEnabled = false
        set6.highlightEnabled = false
        set6.colors = barItems[5].category.map { $0.color }
        
        let data = BarChartData(dataSets: [set, set2, set3, set4, set5, set6])

        chartView.data = data
    }
    
    private func getYValueFor(barItem: Bar) -> [Double] {
        barItem.category.map {
            switch $0 {
            case .requested(let value),
                    .inprogress(let value),
                    .submitted(let value),
                    .returned(let value),
                    .accepted(let value),
                    .overdue(let value):
                return value
            }
        }
        
    }
    
}
