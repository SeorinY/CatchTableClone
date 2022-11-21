//
//  UILabel+.swift
//  CatchTableClone
//
//  Created by Mac Book Pro on 2022/11/21.
//

import UIKit

extension UILabel {
    func changeTextColor(_ changeText: String) {
        guard let text = self.text else { return }
        let attributeString = NSMutableAttributedString(string: text)
        let color = UIColor(red: 252.0 / 255.0, green: 35.0 / 255.0, blue: 6.0 / 255.0, alpha: 1)
        
        attributeString.addAttribute(.foregroundColor, value: color, range: (text as NSString).range(of: changeText))
        self.attributedText = attributeString
    }
}
