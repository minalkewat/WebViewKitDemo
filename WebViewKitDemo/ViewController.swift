//
//  ViewController.swift
//  WebViewKitDemo
//
//  Created by Meenal Kewat on 5/15/19.
//  Copyright © 2019 Meenal. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,UITextFieldDelegate,WKNavigationDelegate {


    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var forwardBtn: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        urlTextField.delegate = self
        webView.navigationDelegate = self
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let  urlString:String = "https://www.apple.com"
        let url = URL(string: urlString)!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        urlTextField.text = urlString
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let  urlString:String = urlTextField.text!
        let url = URL(string: urlString)!
        let urlRequest:URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
        textField.resignFirstResponder()
        
        return true
    }

    @IBAction func forwardButtonTapped(_ sender: Any) {
        if webView.canGoForward{
            webView.goForward()
        }
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        if webView.canGoBack{
            webView.goBack()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backBtn.isEnabled = webView.canGoBack
        forwardBtn.isEnabled = webView.canGoForward
        
        urlTextField.text = webView.url?.absoluteString
    }
}

