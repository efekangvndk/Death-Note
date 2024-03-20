//
//  UIComponentHelper.swift
//  Death Note
//
//  Created by Efekan Güvendik on 17.03.2024.
//

import UIKit

struct UIComponentsHelper {
    static func createCustomLabel(text : String , size :CGFloat, labelBackGroundColor : UIColor , textColor : UIColor , fontName : String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont(name: fontName, size: size)
        label.backgroundColor = labelBackGroundColor
        label.textAlignment = .center
        label.textColor = textColor
        label.numberOfLines = 2
        return label
    }
    
}
