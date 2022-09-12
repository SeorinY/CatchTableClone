//
//  Extesion.swift
//  CatchTableClone
//
//  Created by Mac Book Pro on 2022/09/05.
//

import Foundation
import UIKit

extension UIImage {
    
    func imageResize (sizeChange:CGSize)-> UIImage{
        
        let hasAlpha = true
        let scale: CGFloat = 0.0 // Use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        self.draw(in: CGRect(origin: CGPoint.zero, size: sizeChange))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage!
    }
    
    
}

extension UIView{
    public var width : CGFloat{
        return frame.size.width
    }
    
    public var height : CGFloat{
        return frame.size.height
    }
    
    public var top : CGFloat{
        return frame.origin.y
    }
    public var bottom : CGFloat{
        return frame.origin.y + frame.size.height
    }
    public var left : CGFloat{
        return frame.origin.x
    }
    public var right : CGFloat{
        return frame.origin.x + frame.size.width
    }
}


extension UILabel {
    func changeTextColor(_ changeText: String) {
        guard let text = self.text else { return }
        let attributeString = NSMutableAttributedString(string: text)
        let color = UIColor(red: 252.0 / 255.0, green: 35.0 / 255.0, blue: 6.0 / 255.0, alpha: 1)
        
        attributeString.addAttribute(.foregroundColor, value: color, range: (text as NSString).range(of: changeText))
        self.attributedText = attributeString
    }
}

extension UINavigationController {
    func setBackgroundColor() {
        navigationBar.backgroundColor = .systemBackground
//        navigationBar.isTranslucent = true
    }
}

extension UIViewController {
    func navigationBackBtnLayout() {
        let backImage = UIImage(systemName: "arrow.backward")
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func navigationLabel(_ text: String) {
        let registerLabel = UILabel()
        registerLabel.text = text
        registerLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: registerLabel)
        self.navigationItem.leftItemsSupplementBackButton = true
    }
}
