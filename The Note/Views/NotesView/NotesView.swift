//
//  NotesView.swift
//  Death Note
//
//  Created by Efekan Güvendik on 21.03.2024.
//

import UIKit
import SwiftUI
import CoreData


class NotesView: UIView{
    let noteTextField = UIComponentsHelper.creatCustomTextField(size: 30, fontName: "Themundayfreeversion-Regular", cornerRadius: 20, borderWidth: 2, borderColor: UIColor.black.cgColor, placeholder: "Title", textColor: .black, textBackGroundColor: .white)
    let noteTextView = UIComponentsHelper.creatCustomTextView(textColor: .black, fontName: "Themundayfreeversion-Regular", size: 20,  cornerRadius: 10, borderWidth: 2)
    let titleLabel = UIComponentsHelper.createCustomLabel(text: "Take A Note", size: 25, labelBackGroundColor: UIColor(red: 184/255, green: 140/255, blue: 140/255, alpha: 1.0), textColor: .black, fontName: "Themundayfreeversion-Regular", cornerRadius: 20, borderWidth: 3, borderColor: UIColor.black.cgColor, addshadow: false)
    let saveButton = UIComponentsHelper.creatCustomButton(ButtonName: "Save", tintColor: .black, image: nil, cornerRadius: 10, borderWidth: 2, borderColor: UIColor.yellow.cgColor, backgroundColor: .lightGray, addshadow: true, fontName: "Themundayfreeversion-Regular" )
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .white
        addSubview(noteTextView)
        addSubview(saveButton)
        addSubview(titleLabel)
        addSubview(noteTextField)
        constraintSetting()
        
    }
    
    private func constraintSetting() {
        NSLayoutConstraint.activate([
            
            titleLabel.widthAnchor.constraint(equalToConstant: 160),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.topAnchor.constraint(equalTo: topAnchor,constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            noteTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            noteTextField.topAnchor.constraint(equalTo: topAnchor,constant: 160),
            noteTextField.widthAnchor.constraint(equalToConstant: 200),
            noteTextField.heightAnchor.constraint(equalToConstant: 50),
            noteTextView.widthAnchor.constraint(equalToConstant: 400),
            noteTextView.heightAnchor.constraint(equalToConstant: 600),
            noteTextView.topAnchor.constraint(equalTo: topAnchor,constant: 220),
            noteTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -160),
            noteTextView.leftAnchor.constraint(equalTo: leftAnchor,constant: 20),
            noteTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -80),
            saveButton.widthAnchor.constraint(equalToConstant: 120),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
             
        ])
    }
}
#Preview(body: {
    NotesView()
})

// textView'u deil textfield table view'a alıcaz + basılması ve geri dönmesi düzenleme butonu...
