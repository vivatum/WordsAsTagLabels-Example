//
//  TextViewBuilder.swift
//  WordsAsTagLabels
//
//  Created by Volodymyr Vozniak on 12/06/2020.
//  Copyright © 2020 com.vivatum. All rights reserved.
//

import UIKit

protocol TextViewBuilderProtocol: class {
    func getAttributedTextView(with params: TextViewParameters, completion: @escaping (Result<UITextView, BuilderError>) -> Void)
    var textViewFactory: TextViewFactoryProtocol? { get set }
    var labelFactory: LabelFactoryProtocol? { get set }
    var imagesFactory: ImagesFactoryProtocol? { get set }
    var attrTextFactory: AttributedTextFactoryProtocol? { get set }
}

enum BuilderError: Error {
    case labelError
    case imagesError
    case attrTextError
    case textViewError
}

final class TextViewBuilder: TextViewBuilderProtocol {
    
    var textViewFactory: TextViewFactoryProtocol?
    var labelFactory: LabelFactoryProtocol?
    var imagesFactory: ImagesFactoryProtocol?
    var attrTextFactory: AttributedTextFactoryProtocol?
    
    init(
        textViewFactory: TextViewFactoryProtocol = TextViewFactory(),
        labelFactory: LabelFactoryProtocol = LabelFactory(),
        imagesFactory: ImagesFactoryProtocol = ImagesFactory(),
        attrTextFactory: AttributedTextFactoryProtocol = AttributedTextFactory()
    ) {
        self.textViewFactory = textViewFactory
        self.labelFactory = labelFactory
        self.imagesFactory = imagesFactory
        self.attrTextFactory = attrTextFactory
    }
    
    func getAttributedTextView(with params: TextViewParameters, completion: @escaping (Result<UITextView, BuilderError>) -> Void) {
        guard let labels = self.labelFactory?.getLabelArray(with: params) else {
            completion(.failure(.labelError))
            return
        }
        guard let images = self.imagesFactory?.createImagesArray(labelArray: labels) else {
            completion(.failure(.imagesError))
            return
        }
        guard let attrText = self.attrTextFactory?.createAttributedTextForImages(imageArray: images, space: params.space) else {
            completion(.failure(.attrTextError))
            return
        }
        guard let textView = self.textViewFactory?.createTextView(with: attrText, viewWidth: params.viewWidth) else {
            completion(.failure(.textViewError))
            return
        }
        completion(.success(textView))
    }
    
}
