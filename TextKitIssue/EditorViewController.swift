//
//  ViewController.swift
//  TextKitIssue
//
//  Created by Nathan Tesler on 20/9/2024.
//

import UIKit

class EditorViewController: UIViewController {
    var text: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textView = UITextView(usingTextLayoutManager: true)
        textView.attributedText = NSAttributedString(string: text, attributes: [
            .font: UIFont.systemFont(ofSize: 17),
            .foregroundColor: UIColor.white
        ])
        textView.keyboardDismissMode = .interactive
        
        // WORKAROUND: Uncomment to trigger conversion to TextKit 1, which resolves this issue
        _ = textView.layoutManager
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)
        textView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
}
