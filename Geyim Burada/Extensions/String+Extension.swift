//
//  String+Extension.swift
//  Font Changer
//
//  Created by Y. Yılmaz Erdoğmuş on 05.12.2022.
//

import Foundation

extension String {
    func returnDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return Date()
        }
    }
}
