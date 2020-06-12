//
//  LabelFactory.swift
//  WordsAsTagLabels
//
//  Created by Volodymyr Vozniak on 12/06/2020.
//  Copyright © 2020 com.vivatum. All rights reserved.
//

import UIKit

protocol LabelFactoryProtocol: class {
    func getLabelArray(with params: TextViewParameters) -> [UILabel]
    func createLabel(for word: String, offsetWidth: CGFloat, offsetHeight: CGFloat, cornerRadius: CGFloat) -> UILabel
}

final class LabelFactory: LabelFactoryProtocol {
    
    func getLabelArray(with params: TextViewParameters) -> [UILabel] {
        var labels = [UILabel]()
        for (_, word) in params.words.enumerated() {
            let label = createLabel(
                for: word,
                offsetWidth: params.offsetWidth,
                offsetHeight: params.offsetHeight,
                cornerRadius: params.cornerRadius)
            
            labels.append(label)
        }
        return labels
    }
    
    func createLabel(for word: String, offsetWidth: CGFloat, offsetHeight: CGFloat, cornerRadius: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = word
        label.textAlignment = .center
        label.backgroundColor = .green
        label.sizeToFit()
        
        let frame = label.frame
        let newWidth = frame.width + offsetWidth
        let newHeight = frame.height + offsetHeight
        
        label.frame = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        label.clipsToBounds = true
        label.layer.cornerRadius = cornerRadius
        
        return label
    }
}
