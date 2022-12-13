//
//  Optional+Extension.swift
//  Font Changer
//
//  Created by Y. Yılmaz Erdoğmuş on 05.12.2022.
//

import UIKit

extension Optional {
    enum ObjectType {
        case string
        case int
        case double
        case float
        case cgFloat
        case bool
        case url
        case data
        case uiImage
        case date
        case dictionary
        case dictionaryArray
    }

    // swiftlint:disable cyclomatic_complexity
    // swiftlint:disable function_body_length
    func unwrap(type: ObjectType) -> Any {
        switch type {
        case .int:
            if let unwrapped = self as? Int {
                return unwrapped
            } else {
                return 0
            }
        case .string:
            if let unwrapped = self as? String {
                return unwrapped
            } else {
                return ""
            }
        case .double:
            if let unwrapped = self as? Double {
                return unwrapped
            } else {
                return 0.0
            }
        case .float:
            if let unwrapped = self as? Float {
                return unwrapped
            } else {
                return 0.0
            }
        case .cgFloat:
            if let unwrapped = self as? CGFloat {
                return unwrapped
            } else {
                return CGFloat()
            }
        case .bool:
            if let unwrapped = self as? Bool {
                return unwrapped
            } else {
                return false
            }
        case .url:
            if let unwrapped = self as? URL {
                return unwrapped
            } else {
                return URL(string: "www.neonapps.co")!
            }
        case .data:
            if let unwrapped = self as? Data {
                return unwrapped
            } else {
                return Data()
            }
        case .uiImage:
            if let unwrapped = self as? UIImage {
                return unwrapped
            } else {
                return UIImage()
            }
        case .date:
            if let unwrapped = self as? Date {
                return unwrapped
            } else {
                return Date()
            }
        case .dictionary:
            if let unwrapped = self as? [String: Any] {
                return unwrapped
            } else {
                return ["", ""]
            }
        case .dictionaryArray:
            if let unwrapped = self as? [[String: Any]] {
                return unwrapped
            } else {
                return [["", ""]]
            }
        }
    }
}
