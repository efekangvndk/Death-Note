import UIKit

struct UIComponentsHelper {
    
    static func creatCustomTextView(textColor: UIColor?, fontName: String?, size: CGFloat?, cornerRadius: CGFloat?, borderWidth: CGFloat?) -> UITextView {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = textColor
        textView.font = UIFont(name: fontName ?? "", size: size ?? 0)
        textView.layer.cornerRadius = cornerRadius ?? 0
        textView.layer.borderWidth = borderWidth ?? 0
        textView.textAlignment = .left
        return textView
    }
    
    static func createCustomLabel(text: String, size: CGFloat, labelBackGroundColor: UIColor, textColor: UIColor, fontName: String, cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: CGColor, addShadow: Bool) -> UILabel {
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
        if addShadow {
            label.layer.shadowColor = UIColor.black.cgColor
            label.layer.shadowOffset = CGSize(width: 20, height: 10)
            label.layer.shadowRadius = 10
            label.layer.shadowOpacity = 5
        }
        return label
    }
    
    static func creatCustomButton(buttonName: String, tintColor: UIColor, image: UIImage?, image2: UIImage?, cornerRadius: CGFloat? = nil, borderWidth: CGFloat? = nil, borderColor: CGColor? = nil, backgroundColor: UIColor?, addShadow: Bool, fontName: String, imageSize: CGSize? = nil) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(buttonName, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(tintColor, for: .normal)
        button.setImage(image, for: .normal)
        
        if let cornerRadius = cornerRadius {
            button.layer.cornerRadius = cornerRadius
        }
        
        if let borderWidth = borderWidth {
            button.layer.borderWidth = borderWidth
        }
        
        if let borderColor = borderColor {
            button.layer.borderColor = borderColor
        }
        
        button.backgroundColor = backgroundColor
        
        if let imageSize = imageSize, let image2 = image2 {
            let resizedImage = resizeImage(image: image2, targetSize: imageSize)
            button.setImage(resizedImage, for: .normal)
        } else {
            button.setImage(image2, for: .normal)
        }
        
        if addShadow {
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 2)
            button.layer.shadowRadius = 10
            button.layer.shadowOpacity = 5
        }
        return button
    }
    
    static func creatCustomTextField(size: CGFloat, fontName: String, cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: CGColor, placeholder: String, textColor: UIColor, textBackGroundColor: UIColor) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
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
    
    static func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        let resizedImage = renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
        return resizedImage
    }
}
