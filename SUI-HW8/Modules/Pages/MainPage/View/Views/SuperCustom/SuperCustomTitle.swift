//
//  Untitled.swift
//  SUI-HW8
//
//  Created by Dim on 07.08.2025.
//

import SwiftUI

struct CustomTextAndImageView: UIViewRepresentable {
    let text: String
    let imageString: String?
    var width: CGFloat
    @Binding var heightToCount: CGFloat
    let lineHeightModifier: CGFloat
    let font: UIFont
    let fontStyle: UIFont.TextStyle
    
    init(text: String, imageString: String?, width: CGFloat, heightToCount: Binding<CGFloat>, lineHeightModifier: CGFloat = 1.0, font: UIFont = UIFont.systemFont(ofSize: 16), fontStyle: UIFont.TextStyle = .body) {
        self.text = text
        self.imageString = imageString
        self.width = width
        self._heightToCount = heightToCount
        self.lineHeightModifier = lineHeightModifier
        self.font = font
        self.fontStyle = fontStyle
    }

    func makeUIView(context: Context) -> SizingLabel {
        let label = SizingLabel()
        label.maxWidth = width
        label.textAlignment = .left
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = false
        return label
    }
    
    func updateUIView(_ uiView: SizingLabel, context: Context) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeightModifier
        let scaledFont = UIFontMetrics(forTextStyle: fontStyle).scaledFont(for: font)

       
        let textString = NSMutableAttributedString(
            string: text + " ",
            attributes: [.font: scaledFont, .paragraphStyle: paragraphStyle],
        )
        
        if let imageString = imageString, let image = UIImage(named: imageString) {
            let attachment = NSTextAttachment(image: image)
            attachment.bounds = CGRect(x: 0, y: font.descender + 0.45 * font.capHeight, width: font.capHeight, height: font.capHeight)
            
            let implementedImageString: NSAttributedString = NSAttributedString(attachment: attachment)
            textString.append(implementedImageString)
        }
        
        uiView.attributedText = textString
        uiView.adjustsFontForContentSizeCategory = true
        DispatchQueue.main.async {
            self.heightToCount = uiView.intrinsicContentSize.height
        }
    }
}

class SizingLabel: UILabel {
    var maxWidth: CGFloat = 0
    
    override var intrinsicContentSize: CGSize {
        let constraintSize = CGSize(width: maxWidth, height: .greatestFiniteMagnitude)
        
        guard let attributed = self.attributedText else {
            return super.intrinsicContentSize
        }
        
        let boundingBox = attributed.boundingRect(
            with: constraintSize,
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            context: nil
        )
        
        return CGSize(
            width: ceil(min(boundingBox.width, maxWidth)),
            height: ceil(boundingBox.height)
        )
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.invalidateIntrinsicContentSize()
    }
}
