//
//  UIComponentHelper.swift
//  Death Note
//
//  Created by Efekan Güvendik on 17.03.2024.
//

import UIKit


struct UIComponentsHelper {
    static func createCustomLabel(text : String , size :CGFloat, labelBackGroundColor : UIColor , textColor : UIColor , fontName : String , cornerRadius : CGFloat, borderWidth : CGFloat, borderColor : CGColor ,addshadow : Bool) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont(name: fontName, size: size)
        label.layer.cornerRadius = cornerRadius
        label.layer.borderWidth = borderWidth
        label.layer.borderColor = borderColor
        label.backgroundColor = labelBackGroundColor
        label.textAlignment = .center
        label.textColor = textColor
        label.numberOfLines = 2
        label.clipsToBounds = true
        if addshadow {
            label.layer.shadowColor = UIColor.black.cgColor
            label.layer.shadowOffset = CGSize(width: 20, height: 10)
            label.layer.shadowRadius = 10
            label.layer.shadowOpacity = 5
        }
        return label
    }
    static func creatCustomButton(ButtonName : String , tintColor : UIColor, image : UIImage? , cornerRadius : CGFloat , borderWidth : CGFloat,borderColor : CGColor,backgroundColor : UIColor, addshadow : Bool)-> UIButton{
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(ButtonName , for: .normal)
            button.setTitleColor(tintColor, for: .normal) 
            button.setImage(image, for: .normal)
            button.layer.cornerRadius = cornerRadius
            button.layer.borderWidth = borderWidth
            button.layer.borderColor = borderColor
            button.backgroundColor = backgroundColor
        
        if addshadow {
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 2)
            button.layer.shadowRadius = 10
            button.layer.shadowOpacity = 5
        }
            return button
    }
}

