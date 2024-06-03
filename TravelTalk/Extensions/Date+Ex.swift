//
//  Date+Ex.swift
//  TravelTalk
//
//  Created by J Oh on 6/3/24.
//

import UIKit

extension Date {
    func formatForChat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormatter.string(from: self)
    }
}

