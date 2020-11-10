//
//  UIViewFrameExtension.swift
//  ZDSwiftToolKit
//
//  Created by Zero.D.Saber on 2020/11/10.
//

import UIKit

extension UIView: ZDBase {
    
    /// UIView extensions.
    public var zd: ZDExtension<UIView> {
        get {
            return ZDExtension(self)
        }
        set {
            // this enables using ZDExtension to "mutate" base object
        }
    }
}

extension ZDExtension where Base: UIView {
    
    //MARK: - Frame
    
    public var x: CGFloat {
        get {
            self.base.frame.origin.x
        }
        set {
            var tempFrame = self.base.frame
            tempFrame.origin.x = newValue
            self.base.frame = tempFrame
        }
    }
    
    public var y: CGFloat {
        get {
            self.base.frame.origin.x
        }
        set {
            var tempFrame = self.base.frame
            tempFrame.origin.y = newValue
            self.base.frame = tempFrame
        }
    }
    
    public var width: CGFloat {
        get {
            self.base.frame.size.width
        }
        set {
            var tempFrame = self.base.frame
            tempFrame.size.width = newValue
            self.base.frame = tempFrame
        }
    }
    
    public var height: CGFloat {
        get {
            self.base.frame.size.height
        }
        set {
            var tempFrame = self.base.frame
            tempFrame.size.height = newValue
            self.base.frame = tempFrame
        }
    }
    
    public var left: CGFloat {
        get {
            self.x
        }
        set {
            self.x = newValue
        }
    }
    
    public var right: CGFloat {
        get {
            self.x + self.width
        }
        set {
            self.x = newValue - self.width
        }
    }
    
    public var top: CGFloat {
        get {
            self.y
        }
        set {
            self.y = newValue
        }
    }
    
    public var bottom: CGFloat {
        get {
            self.y + self.height
        }
        set {
            self.y = newValue - self.height
        }
    }
    
    public var centerX: CGFloat {
        get {
            self.x + self.width * 0.5
        }
        set {
            self.x = newValue - self.width * 0.5
        }
    }
    
    public var centerY: CGFloat {
        get {
            self.y + self.height * 0.5
        }
        set {
            self.y = newValue - self.height * 0.5
        }
    }
    
    public var center: CGPoint {
        get {
            return CGPoint(x: self.centerX, y: self.centerY)
        }
        set {
            self.centerX = newValue.x
            self.centerY = newValue.y
        }
    }
    
    public var boundsCenterX: CGFloat {
        self.width * 0.5
    }
    
    public var boundsCenterY: CGFloat {
        self.height * 0.5
    }
    
    @discardableResult
    public func roundCorners(_ corners: UIRectCorner = UIRectCorner.allCorners, radius: CGFloat) -> Base {
        let path = UIBezierPath(roundedRect: self.base.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        
        self.base.layer.mask = mask
        
        return self.base
    }
}

