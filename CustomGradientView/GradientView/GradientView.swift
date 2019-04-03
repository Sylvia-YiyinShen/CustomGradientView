//
//  GradientView.swift
//  CustomGradientView
//
//  Created by Zhihui Sun on 3/4/19.
//  Copyright © 2019 Sylvia Shen. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GradientView: UIView {
    private var gradientLayer: CAGradientLayer?
    @IBInspectable
    public var isHorizontal: Bool = true {
        didSet {
            updateGradientLayer(startColor: startColor.cgColor, endColor: endColor.cgColor)
        }
    }
    
    private func updateGradientLayer(startColor: CGColor, endColor: CGColor) {
        gradientLayer = CAGradientLayer()
        if isHorizontal {
            gradientLayer?.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer?.endPoint = CGPoint(x: 1, y: 0.5)
        } else {
            gradientLayer?.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer?.endPoint = CGPoint(x: 0.5, y: 1)
        }
        gradientLayer?.frame = bounds
        gradientLayer?.colors = [startColor, endColor]
        
        if let gradientLayer = gradientLayer {
            gradientLayer.removeFromSuperlayer()
            layer.addSublayer(gradientLayer)
        }
        
    }
    
    @IBInspectable
    public var startColor: UIColor = UIColor.clear {
        didSet {
            updateGradientLayer(startColor: startColor.cgColor, endColor: endColor.cgColor)
        }
    }
    
    @IBInspectable
    public var endColor: UIColor = UIColor.clear {
        didSet {
            updateGradientLayer(startColor: startColor.cgColor, endColor: endColor.cgColor)
        }
    }
}
