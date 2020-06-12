//
//  TextViewFactory.swift
//  WordsAsTagLabels
//
//  Created by Volodymyr Vozniak on 12/06/2020.
//  Copyright © 2020 com.vivatum. All rights reserved.
//

import UIKit

protocol TextViewFactoryProtocol: class {
    func createTextView(with attrText: NSMutableAttributedString, viewWidth: CGFloat) -> UITextView
}

final class TextViewFactory: TextViewFactoryProtocol {
    
    func createTextView(with attrText: NSMutableAttributedString, viewWidth: CGFloat) -> UITextView {
        let attributedTextView = UITextView()
        attributedTextView.attributedText = attrText
        attributedTextView.textAlignment = .left
        attributedTextView.isEditable = false
        attributedTextView.isSelectable = false
        attributedTextView.isScrollEnabled = false
        attributedTextView.isUserInteractionEnabled = false
        attributedTextView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: attributedTextView.frame.height)
        attributedTextView.sizeToFit()
        return attributedTextView
    }
}
