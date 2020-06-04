//
//  ViewController.swift
//  WordsAsTagLabels
//
//  Created by Vivatum on 04/06/2020.
//  Copyright © 2020 com.vivatum. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    let words = ["AAA", "bbb", "128736542376", "How are you?", "Some text", "Foo label", "Give me a star 😁", "One more label"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addTagsView(for: words)
    }
    
    private func addTagsView(for stringArray: [String]) {
        if let tagsView = self.getTagsView(for: stringArray) {
            DispatchQueue.main.async {
                tagsView.center = self.view.center
                self.view.addSubview(tagsView)
            }
        }
    }

    private func getTagsView(for words: [String]) -> UITextView? {
        let tagFactory = TagFactory(wordsArray: words)
        let tagViewWidth = self.view.bounds.width * 0.8
        return tagFactory.getTagTextView(viewWidth: tagViewWidth)
    }

}

