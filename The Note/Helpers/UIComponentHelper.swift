//
//  UIComponentHelper.swift
//  Death Note
//
//  Created by Efekan Güvendik on 17.03.2024.
//

import UIKit


struct UIComponentsHelper {
    
    static func creatCustomTextView(textColor : UIColor , fontName : String , size : CGFloat , cornerRadius : CGFloat ,borderWidth : CGFloat  )-> UITextView{
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = textColor
        textView.font = UIFont(name: fontName, size: size)
        textView.layer.cornerRadius = cornerRadius
        textView.layer.borderWidth = borderWidth
        textView.textAlignment = .left
    return textView
    }
    
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
        label.numberOfLines = 0
        label.clipsToBounds = true
        if addshadow {
            label.layer.shadowColor = UIColor.black.cgColor
            label.layer.shadowOffset = CGSize(width: 20, height: 10)
            label.layer.shadowRadius = 10
            label.layer.shadowOpacity = 5
        }
        return label
    }
    static func creatCustomButton(ButtonName : String , tintColor : UIColor, image : UIImage? , cornerRadius : CGFloat , borderWidth : CGFloat,borderColor : CGColor,backgroundColor : UIColor, addshadow : Bool, fontName: String )-> UIButton{
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(ButtonName , for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
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
    static func creatCustomTextField(text : String?, size : CGFloat , fontName : String , cornerRadius : CGFloat, borderWidth : CGFloat , borderColor : CGColor, placeholder : String
                                     ,textColor : UIColor,textBackGroundColor : UIColor) -> UITextField{
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = text
        textField.font = UIFont(name: fontName , size: size)
        textField.layer.cornerRadius = cornerRadius
        textField.layer.borderWidth = borderWidth
        textField.layer.borderColor = borderColor
        textField.textColor = textColor
        textField.backgroundColor = textBackGroundColor
        textField.placeholder = placeholder
        textField.textAlignment = .center
       return textField
    }
}

