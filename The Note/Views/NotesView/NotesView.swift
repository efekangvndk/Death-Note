//
//  NotesView.swift
//  Death Note
//
//  Created by Efekan Güvendik on 21.03.2024.
//

import UIKit
import SwiftUI


class NotesView: UIView{

    let noteTextField = UIComponentsHelper.creatCustomTextField(text: nil , size: 40, fontName: "The Valentine", cornerRadius: 10, borderWidth: 2, borderColor: UIColor.yellow.cgColor, placeholder: "Take A Note", textColor: .black, textBackGroundColor: .lightGray)
    let saveButton = UIComponentsHelper.creatCustomButton(ButtonName: "Save", tintColor: .black, image: nil, cornerRadius: 10, borderWidth: 2, borderColor: UIColor.yellow.cgColor, backgroundColor: .lightGray, addshadow: true)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .white
        addSubview(noteTextField)
        addSubview(saveButton)
        constraintSetting()
    }
    
    private func constraintSetting() {
        NSLayoutConstraint.activate([
            noteTextField.widthAnchor.constraint(equalToConstant: 200),
            noteTextField.heightAnchor.constraint(equalToConstant: 200),
            noteTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            noteTextField.centerYAnchor.constraint(equalTo: centerYAnchor,constant: -200),
            saveButton.widthAnchor.constraint(equalToConstant: 120),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 200),
        ])
    }
}
#Preview(body: {
    NotesView()
})

