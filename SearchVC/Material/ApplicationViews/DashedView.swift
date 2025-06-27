//
//  DashedView.swift
//  LanistaFootball
//
//  Created by Navanindra Vats on 02/04/24.
//

import UIKit

class DashedView: UIView {
    
    @IBInspectable
    public var color:UIColor = .lightGray
    
    @IBInspectable
    public var lineWidth:CGFloat = 1
    
    @IBInspectable
    public var isHorizontal:Bool = true
    
    @IBInspectable
    public var patternOne:Int = 1
    
    @IBInspectable
    public var patternTwo:Int = 1
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.addBorder(color: color, lineWidth: lineWidth, dashPattern: [NSNumber(integerLiteral: patternOne), NSNumber(integerLiteral: patternTwo)], rect: rect)
    }
    
    func addBorder(color: UIColor, lineWidth: CGFloat, dashPattern: [NSNumber], rect:CGRect) {
        if let sub = self.layer.sublayers {
            if let index = sub.firstIndex(where: {$0.name == "DashedBorder"}) {
                sub[index].removeFromSuperlayer()
                insert()
            } else {
                insert()
            }
        } else {
            insert()
        }
        
        func insert() {
            self.layoutIfNeeded()
            let borderLayer = CAShapeLayer()
            borderLayer.name = "DashedBorder"
            borderLayer.strokeColor = color.cgColor
            borderLayer.fillColor = nil
            borderLayer.lineWidth = lineWidth
            borderLayer.lineDashPattern = dashPattern
            
            let path = UIBezierPath()
            path.lineWidth = lineWidth
            path.move(to: CGPoint(x: isHorizontal ? rect.minX : rect.midX, y: isHorizontal ? rect.midY : rect.minY))
            path.addLine(to: CGPoint(x: isHorizontal ? rect.maxX : rect.midX , y: isHorizontal ? rect.midY : rect.maxY))
            borderLayer.path = path.cgPath
            
            self.layer.addSublayer(borderLayer)
        }
    }
}
