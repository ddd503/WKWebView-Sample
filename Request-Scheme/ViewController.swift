//
//  ViewController.swift
//  Request-Scheme
//
//  Created by kawaharadai on 2018/07/07.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var webView: CustomWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    private func setup() {
        self.webView = CustomWebView(frame: .zero, configuration: CustomWebView.setupConfiguration())
        
        self.view.addSubview(self.webView)
        
        self.setupConstain(webView: self.webView)

        guard let requestURL = URL(string: "https://qiita.com/") else {
            print("requestURL is nil")
            return
        }
        self.webView.load(URLRequest(url: requestURL))
    }
    
    private func setupConstain(webView: WKWebView?) {
        webView?.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[v0]|",
                                                                    options: NSLayoutFormatOptions(),
                                                                    metrics: nil,
                                                                    views: ["v0": webView ?? WKWebView()]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[v0]|",
                                                                    options: NSLayoutFormatOptions(),
                                                                    metrics: nil,
                                                                    views: ["v0": webView ?? WKWebView()]))
    }
}

