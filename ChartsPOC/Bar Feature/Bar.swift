//
//  Bar.swift
//  Charts
//
//  Created by Karthik K Manoj on 24/01/23.
//

import UIKit

struct Bar {
    let labelText: String
    let category: [Category]
    
    enum Category {
        case requested(percentage: Double)
        case inprogress(percentage: Double)
        case submitted(percentage: Double)
        case returned(percentage: Double)
        case accepted(percentage: Double)
        case overdue(percentage: Double)
        
        var color: UIColor {
            switch self {
            case .requested:
                return UIColor(red: 253/255, green: 100/255, blue: 18/255, alpha: 1.0)
            case .inprogress:
                return UIColor(red: 0/255, green: 137/255, blue: 235/255, alpha: 1.0)
            case .submitted:
                return UIColor(red: 255/255, green: 182/255, blue: 0/255, alpha: 1.0)
            case .returned:
                return UIColor(red: 117/255, green: 74/255, blue: 252/255, alpha: 1.0)
            case .accepted:
                return UIColor(red: 78/255, green: 181/255, blue: 35/255, alpha: 1.0)
            case .overdue:
                return UIColor(red: 217/255, green: 57/255, blue: 84/255, alpha: 1.0)
            }
        }
    }
}
