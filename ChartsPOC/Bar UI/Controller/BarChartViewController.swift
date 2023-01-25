//
//  BarChartViewController.swift
//  ChartsPOC
//
//  Created by Karthik K Manoj on 23/01/23.
//

import UIKit

final class BarChartViewController: UIViewController {
    internal let barChartView: UIView // Interface to hide `BarChartView`
    private let barChartLoader: BarChartLoader // Interface to hide the bar data's provenance
    private let onLoad: ([Bar]) -> Void // Interface to let client know bar data has been received.
    
    internal init(
        barChartView: UIView,
        barChartLoader: BarChartLoader,
        onLoad: @escaping ([Bar]) -> Void
    ) {
        self.barChartView = barChartView
        self.barChartLoader = barChartLoader
        self.onLoad = onLoad
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        buildConstraint()
        
        barChartLoader.load { result in
            if case let .success(items) = result {
                self.onLoad(items)
            }
        }
    }
    
    private func buildConstraint() {
        view.addSubview(barChartView)
        barChartView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            barChartView.heightAnchor.constraint(equalToConstant: 200),
            barChartView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            barChartView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            barChartView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

