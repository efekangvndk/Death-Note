//
//  UIComponentHelper.swift
//  Death Note
//
//  Created by Efekan Güvendik on 17.03.2024.
//

import UIKit

struct UIComponentsHelper {
    static func createCustomLabel(text : String , size :CGFloat, labelBackGroundColor : UIColor , textColor : UIColor , fontName : String , cornerRadius : CGFloat, borderWidth : CGFloat, borderColor : CGColor ) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont(name: fontName, size: size)
        label.layer.cornerRadius = cornerRadius
        label.layer.borderWidth = borderWidth
        label.layer.borderColor = borderColor
        label.clipsToBounds = true
        label.backgroundColor = labelBackGroundColor
        label.textAlignment = .center
        label.textColor = textColor
        label.numberOfLines = 2
        return label
    }
        static func creatCustomButton(ButtonName : String , tintColor : UIColor, image : UIImage , cornerRadius : CGFloat , borderWidth : CGFloat,borderColor : CGColor,backgroundColor : UIColor)-> UIButton{
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(ButtonName , for: .normal)
            button.tintColor = tintColor
            button.setImage(image, for: .normal)
            button.layer.cornerRadius = cornerRadius
            button.layer.borderWidth = borderWidth
            button.layer.borderColor = borderColor
            button.backgroundColor = backgroundColor
            return button
        
    }
}
