//
//  Alert.swift
//  WaterDrink
//
//  Created by 박경춘 on 2023/03/20.
//

import Foundation

struct Alert: Codable {
    var id: String = UUID().uuidString
    let date: Date
    var isOn: Bool
    
    var time: String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm"
        return timeFormatter.string(from: date)
    }
    
    var meridiem: String {
        let meridiemFormatter = DateFormatter()
        meridiemFormatter.dateFormat = "a"
        meridiemFormatter.locale = Locale(identifier: "ko")
        return meridiemFormatter.string(from: date)
    }
}
