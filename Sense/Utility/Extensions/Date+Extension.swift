//
//  Date+Extension.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import Foundation

extension Date {
  static func from(unixTime: String?) -> String {
    guard let time = unixTime else { return ""}
    let date = Date(timeIntervalSince1970: Double(time) ?? 0)
    let formater = DateFormatter()
    formater.dateFormat = "MM/dd/yyyy, EE"
    return formater.string(from: date)
  }
}
