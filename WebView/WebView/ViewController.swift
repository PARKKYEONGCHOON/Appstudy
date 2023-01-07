//
//  ViewController.swift
//  WebView
//
//  Created by 박경춘 on 2023/01/07.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate  {
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myActivity: UIActivityIndicatorView!
    @IBOutlet var myWebView: WKWebView!
    
    func loadWebPage(_ url: String)
    {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        loadWebPage("https://www.naver.com")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivity.startAnimating()
        myActivity.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivity.stopAnimating()
        myActivity.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivity.stopAnimating()
        myActivity.isHidden = true
    }
    
    func checkUrl(_ url:String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("https://")
        
        if !flag {
            strUrl = "https://" + strUrl
        }
        
        
        return strUrl
    }
    

    @IBAction func btnGO(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = " "
        loadWebPage(myUrl)
    }
    
    @IBAction func btnSite1(_ sender: UIButton) {
        loadWebPage("https://www.google.com")
    }
    
    @IBAction func btnSite2(_ sender: UIButton) {
        loadWebPage("https://www.youtube.com")
    }
    
    @IBAction func btnHtml(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지</p><p><a href=\"http://2sam.net\">2sam</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnRewind(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnFoward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}

