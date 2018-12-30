//
//  FilmsWebViewController.swift
//  StarWarsApp
//
//  Created by David López on 30/12/18.
//  Copyright © 2018 David López. All rights reserved.
//

import UIKit
import WebKit

class FilmsWebViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    var urlString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading" {
            if webView.isLoading {
                activityIndicator.startAnimating()
                activityIndicator.isHidden = false
            } else {
                activityIndicator.stopAnimating()
            }
        }
    }
}
