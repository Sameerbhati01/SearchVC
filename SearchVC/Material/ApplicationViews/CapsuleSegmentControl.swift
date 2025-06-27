//
//  CapsuleSegmentControl.swift
//  ChorApp
//
//  Created by Navanindra Vats on 22/12/23.
//

import Foundation
import UIKit

//class CapsuleSegmentControl : UISegmentedControl {
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//    private let segmentInset: CGFloat = 6
//    private let segmentImage: UIImage? = UIImage(color: UIColor.init(hexString: "#003A4E"))
//
//    override func layoutSubviews(){
//        super.layoutSubviews()
//        layer.cornerRadius = bounds.height/2
//        let foregroundIndex = numberOfSegments
//        if subviews.indices.contains(foregroundIndex), let foregroundImageView = subviews[foregroundIndex] as? UIImageView {
//            foregroundImageView.bounds = foregroundImageView.bounds.insetBy(dx: segmentInset, dy: segmentInset)
//            foregroundImageView.image = segmentImage
//            foregroundImageView.layer.removeAnimation(forKey: "SelectionBounds")
//            foregroundImageView.layer.masksToBounds = true
//            foregroundImageView.layer.cornerRadius = foregroundImageView.bounds.height/2
//            self.setTitleTextAttributes([.foregroundColor: UIColor.white,
//                                         .font:UIFont.AppFontWith(name: .SemiBold, size: 14)!], for: .normal)
//            self.setTitleTextAttributes([.foregroundColor: UIColor.appTheme,
//                                         .font:UIFont.AppFontWith(name: .SemiBold, size: 14)!], for: .selected)
//        }
//        
//    }
//}
