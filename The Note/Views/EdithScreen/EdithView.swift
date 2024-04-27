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
    
    let edithTextField = UIComponentsHelper.creatCustomTextView(textColor: .black, fontName: "Themundayfreeversion-Regular", size: 20, cornerRadius: nil , borderWidth: nil )
    let edithSaveButton = UIComponentsHelper.creatCustomButton(ButtonName: "Save Button", tintColor: .black, image: "saveimage" , cornerRadius: 20, borderWidth: 2, borderColor: .black, backgroundColor: .gray, addshadow: true , fontName: "Themundayfreeversion-Regular")
    
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
    }
    
    private func constrainSettings(){
        NSLayoutConstraint.activate([
        
            
            
        ])
    }
    
    
}
