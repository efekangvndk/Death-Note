//
//  HomeView.swift
//  Death Note
//
//  Created by Efekan Güvendik on 17.03.2024.
//

import UIKit

class HomeView: UIView {
    
    let title = UIComponentsHelper.createCustomLabel(text: "Death Note", size: 15, labelBackGroundColor: .red, textColor: .white, fontName: "Poppins-Regular")
    let addButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView()  {
        addSubview(title)
        constraintSettings()
        backgroundColor = .darkGray
        
    }
    
    private func constraintSettings() {
        NSLayoutConstraint.activate([
            title.widthAnchor.constraint(equalToConstant: 100),
            title.heightAnchor.constraint(equalToConstant: 50),
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    
    
    
    
    
    
}
