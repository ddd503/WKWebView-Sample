//
//  CustomWebView.swift
//  Request-Scheme
//
//  Created by kawaharadai on 2018/07/07.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit
import WebKit

final class CustomWebView: WKWebView {
    
    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
        setupWebView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    deinit {
        self.navigationDelegate = nil
        self.uiDelegate = nil
    }
    
    // MARK: - Setup
    private func setupWebView() {
        self.navigationDelegate = self
        self.uiDelegate = self
        self.allowsBackForwardNavigationGestures = true
    }
    
    /// configに設定を加える場合はここで行う
    static func setupConfiguration() -> WKWebViewConfiguration {
        return WKWebViewConfiguration()
    }
}

// MARK: - WKNavigationDelegate
extension CustomWebView: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisionalNavigation")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("didFinish")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("didFailProvisionalNavigation")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("didFail")
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print("decidePolicyFor")
        // 読み込みを許可
        decisionHandler(.allow)
    }
}

// MARK: - WKUIDelegate
extension CustomWebView: WKUIDelegate {
    
    /// _blank挙動対応
    func webView(_ webView: WKWebView,
                 createWebViewWith configuration: WKWebViewConfiguration,
                 for navigationAction: WKNavigationAction,
                 windowFeatures: WKWindowFeatures) -> WKWebView? {
        
        guard
            let targetFrame = navigationAction.targetFrame,
            targetFrame.isMainFrame else {
                webView.load(navigationAction.request)
                return nil
        }
        return nil
    }
    
}
