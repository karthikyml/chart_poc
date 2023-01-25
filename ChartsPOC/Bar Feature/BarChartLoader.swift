//
//  BarChartLoader.swift
//  Charts
//
//  Created by Karthik K Manoj on 24/01/23.
//

import Foundation

protocol BarChartLoader {
    typealias Result = Swift.Result<[Bar], Error>
    
    func load(completion: @escaping (Result) -> Void)
}
