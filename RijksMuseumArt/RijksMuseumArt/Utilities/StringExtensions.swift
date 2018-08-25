//  StringExtensions.swift
//  Ranker
//
//  Created by Markandaiya Harsha on 25/08/18.
//  Copyright © 2018 markandaiya. All rights reserved.
//


// 4NniIOvP api key


import Foundation
import UIKit



extension Data {
    var hexString: String {
        let hexString = map { String(format: "%02.2hhx", $0) }.joined()
        return hexString
    }
    
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension String {
    func base64Encoded() -> String {
        guard let plainData = (self as NSString).data(using: String.Encoding.utf8.rawValue) else {
            fatalError()
        }
        let base64String = plainData.base64EncodedString(options:  [])
        return base64String as String
    }
    
    
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    
    func getWidthOfString(withSize: CGFloat) -> CGFloat {
        
        let size: CGSize = (self as NSString).size(withAttributes: [.font: UIFont(name: "Roboto-bold", size: withSize)!])
        return size.width
    }
    func isEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$", options: [.caseInsensitive])
        return regex.firstMatch(in: self, options: [], range: NSMakeRange(0, utf16.count)) != nil
    }
    
    func nsRange(from range: Range<Index>) -> NSRange {
        return NSRange(range, in: self)
    }
    
    func isValidString() -> Bool {
       return !(self.trimmingCharacters(in: .whitespacesAndNewlines) == "")
    }
    

}

