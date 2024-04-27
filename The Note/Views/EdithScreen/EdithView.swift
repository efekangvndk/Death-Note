//
//  EdithScreenView.swift
//  The Note
//
//  Created by Efekan Güvendik on 12.04.2024.
//

import SwiftUI
import UIKit
import CoreData

class EdithView : UIView{
    
    var saveimage = UIImage?.self
    
    let edithTextField = UIComponentsHelper.creatCustomTextView(textColor: .black, fontName: "Themundayfreeversion-Regular", size: 20, cornerRadius: 10 , borderWidth: 2 )
    let edithSaveButton = UIComponentsHelper.creatCustomButton(buttonName: "", tintColor: .black, image: nil, image2: UIImage(named: "saveimage"), cornerRadius: nil, borderWidth: nil, borderColor: UIColor.black.cgColor, backgroundColor: nil, addShadow: false, fontName: "Themundayfreeversion-Regular", imageSize: CGSize(width: 200, height: 200))

    override init(frame: CGRect) {
        super.init(frame: frame)
        SetupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func SetupView(){
        backgroundColor = .white
        addSubview(edithTextField)
        addSubview(edithSaveButton)
        constrainSettings()
    }
    
    private func constrainSettings() {
        NSLayoutConstraint.activate([
            edithTextField.topAnchor.constraint(equalTo: topAnchor, constant: 160),
            edithTextField.widthAnchor.constraint(equalToConstant: 200),
            edithTextField.heightAnchor.constraint(equalToConstant: 50),
            edithTextField.widthAnchor.constraint(equalToConstant: 400),
            edithTextField.heightAnchor.constraint(equalToConstant: 600),
            edithTextField.topAnchor.constraint(equalTo: topAnchor, constant: 220),
            edithTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -160),
            edithTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            edithTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // edithSaveButton boyutlandırma
            edithSaveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            edithSaveButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            // Görselin boyutuna göre genişlik ve yükseklik belirleme
            edithSaveButton.widthAnchor.constraint(equalToConstant: edithSaveButton.imageView?.image?.size.width ?? 200),
            edithSaveButton.heightAnchor.constraint(equalToConstant: edithSaveButton.imageView?.image?.size.height ?? 200)
        ])
    }

    
    
}
