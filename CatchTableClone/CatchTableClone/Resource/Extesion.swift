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
