//
//  UIView +.swift
//  CatchTableClone
//
//  Created by Mac Book Pro on 2022/11/16.
//

import UIKit

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
