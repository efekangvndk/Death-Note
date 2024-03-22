//
//  NotesView.swift
//  Death Note
//
//  Created by Efekan Güvendik on 21.03.2024.
//

import UIKit
import SwiftUI


class NotesView: UIView{

    let noteTextField = UIComponentsHelper.creatCustomTextField(text: nil , size: 25, fontName: "The Valentine", cornerRadius: 10, borderWidth: 2, borderColor: UIColor.yellow.cgColor, placeholder: "Take A Note ", textColor: .black, textBackGroundColor: .red)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(noteTextField)
        constraintSetting()
        backgroundColor = .darkGray
    }
    
    private func constraintSetting() {
        NSLayoutConstraint.activate([
            noteTextField.widthAnchor.constraint(equalToConstant: 120),
            noteTextField.heightAnchor.constraint(equalToConstant: 50),
            noteTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            noteTextField.centerYAnchor.constraint(equalTo: centerYAnchor,constant: 200)
            
        ])
    }
}
#Preview(body: {
    NotesView()
})

