//
//  AttributedTextFactory.swift
//  WordsAsTagLabels
//
//  Created by Volodymyr Vozniak on 12/06/2020.
//  Copyright © 2020 com.vivatum. All rights reserved.
//

import UIKit

protocol AttributedTextFactoryProtocol: class {
    func createAttributedTextForImages(imageArray: [UIImage], space: String) -> NSMutableAttributedString?
}

final class AttributedTextFactory: AttributedTextFactoryProtocol {

    func createAttributedTextForImages(imageArray: [UIImage], space: String) -> NSMutableAttributedString? {
        guard !imageArray.isEmpty else { return nil }
        let attrText = NSMutableAttributedString()
        let attrSpace = NSAttributedString(string: space)
        
        for image in imageArray {
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = image
            imageAttachment.bounds = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
            let imageString = NSAttributedString(attachment: imageAttachment)
            attrText.append(imageString)
            attrText.append(attrSpace)
        }
        return attrText
    }
    
}
