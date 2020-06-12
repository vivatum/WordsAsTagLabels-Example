//
//  ViewController.swift
//  WordsAsTagLabels
//
//  Created by Vivatum on 04/06/2020.
//  Copyright © 2020 com.vivatum. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    private let words = ["AAA", "bbb", "128736542376", "How are you?", "Some text", "Foo label", "Give me a star 😁", "One more label"]
    private var builder: TextViewBuilderProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.builder = TextViewBuilder()
        self.createTagsView(for: words)
    }
    
    private func createTagsView(for stringArray: [String]) {
        
        let textViewParams = TextViewParameters(
            words: words,
            space: " ",
            viewWidth: self.view.bounds.width * 0.8,
            offsetWidth: 20.0,
            offsetHeight: 10.0,
            cornerRadius: 6.0)
        
        self.builder?.getAttributedTextView(with: textViewParams) { result in
            switch result {
            case .success(let textView):
                self.addTagsView(textView)
            case .failure(let error):
                print("Can't create TextView with error: \(error.localizedDescription)")
            }
        }
    }

    private func addTagsView(_ textView: UITextView) {
        DispatchQueue.main.async {
            textView.center = self.view.center
            self.view.addSubview(textView)
        }
    }

}

