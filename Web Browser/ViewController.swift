//
//  ViewController.swift
//  Web Browser
//
//  Created by Bhavya Singh on 3/24/21.
//

import UIKit
import WebKit

class ViewController: UIViewController, UISearchBarDelegate,
                      WKNavigationDelegate {
    
    //, WKUIDelegate {
    
    // WKNavigation for navigation delegate
    // to override webview func called when load url
    
    // Outlets for web view and buttons in ViewController
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet var forward_button: UIBarButtonItem!
    @IBOutlet var back_button: UIBarButtonItem!
    @IBOutlet var searchBar: UISearchBar!
    
    // Array and index to store url and thumbnail
    var tab_url:[URL] = []
    var thumbnail:[UIImage] = []
    var current_index = 0
    
    // Global constants
    let blank_url = URL(string: "about:blank")
    let prompt = "Enter Valid https URL"
    let default_image = UIImage(named: "blank_image")
    let valid_url = "https"
    
    /*
     Function Name : viewDidLoad
     Use : Initialise view and create first tab
     Parameters : None
     Return Type : None
     Return Value : None
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialise by adding element to empty array
        tab_url.append(blank_url!)
        thumbnail.append(default_image!)
        // Load initial blank page
        webView.load(URLRequest(url: blank_url!))
        
        // Allow back and forward swipe gestures
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
    }
    
    /*
     Function Name : refresh
     Use : Refresh button action
     Parameters : sender: Any
     Return Type : None
     Return Value : None
     */
    @IBAction func refresh(_ sender: Any) {
        webView.reload()
    }
    
    /*
     Function Name : back
     Use : Back button action
     Parameters : sender: Any
     Return Type : None
     Return Value : None
     */
    @IBAction func back(_ sender: Any) {
            webView.goBack()
    }
    
    /*
     Function Name : forward
     Use : Forward button action
     Parameters : sender: Any
     Return Type : None
     Return Value : None
     */
    @IBAction func forward(_ sender: Any) {
            webView.goForward()
    }
    
    /*
     Function Name : restoreTab
     Use : Load tab at given index in url array
     Parameters : index: Int
     Return Type : None
     Return Value : None
     */
    func restoreTab(index: Int){
        webView.load(URLRequest(url: tab_url[index]))
    }
    
    /*
     Function Name : storeCurrentTabThumbnail
     Use : Store screen shot of current tab
     Parameters : None
     Return Type : None
     Return Value : None
     */
    func storeCurrentTabThumbnail() {
        // Call snapshot
        webView.takeSnapshot( with: nil) {image, error in
            // If image is procured, store image. Else print error
            if let image = image {
                // Store procured image
                self.thumbnail[self.current_index] = image
            } else {
                print("Snapshot failed:\(error?.localizedDescription ?? "--")")
            }
        }
    }
    
    /*
     Function Name : removeTab
     Use : Remove Current Tab
     Parameters : sender: Any
     Return Type : None
     Return Value : None
     */
    @IBAction func removeTab(_ sender: Any) {
        
        // If more than one tab left, remove current tab from arrays
        // & load first tab. Else current tab is the only tab. Load blank page.
        if tab_url.count > 1 {
            // Remove current tab from array
            tab_url.remove(at: current_index)
            thumbnail.remove(at: current_index)
            // Restore first tab
            current_index = 0
            restoreTab(index: current_index)
        }
        // Else current tab is the only tab. Load blank page.
        else {
            current_index = 0
            webView.load(URLRequest(url: blank_url!))
        }
        
    }
    
    /*
     Function Name : addTab
     Use : Add/plus button action, Load blank new page at end of tabs list
     Parameters : sender: Any
     Return Type : None
     Return Value : None
     */
    @IBAction func addTab(_ sender: Any) {
        // Index of new tab = tab arrays size
        current_index = tab_url.count
        // Increase size of tab arrays
        tab_url.append(webView.url!)
        thumbnail.append(default_image!)
        // Load blank page on new tab
        webView.load(URLRequest(url: blank_url!))
    }
    
    /*
     Function Name : searchBarSearchButtonClicked
     Use : Called when user input into search bar
     Parameters : searchBar: UISearchBar
     Return Type : None
     Return Value : None
     */
    func searchBarSearchButtonClicked (_ searchBar: UISearchBar) {
        
        // Move keyboard 
        searchBar.resignFirstResponder()
        
        // If valid url entered in serach bar, load url. Else, load blank page
        if searchBar.text!.starts(with: valid_url){
            if let url = URL(string:searchBar.text!) {
                webView.load(URLRequest(url: url))
            }
        } else {
            webView.load(URLRequest(url: blank_url!))
        }
    }
    
    /*
     Function Name : webView
     Use : Called after each url load in webview
     Parameters : webView: WKWebView, didFinish navigation: WKNavigation!
     Return Type : None
     Return Value : None
     */
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {

        // If blank page loaded, show prompt in search bar.
        // Else, show url in search bar
        if webView.url == blank_url {
            searchBar.text = prompt
        } else {
            searchBar.text = webView.url?.absoluteString
        }
    
        
        // Enable back and forward buttons
        back_button.isEnabled = webView.canGoBack;
        forward_button.isEnabled = webView.canGoForward;
        
        // Store current url and screenshot in arrays
        tab_url[current_index] = webView.url!
        storeCurrentTabThumbnail()
    }
    
    /*
     Function Name : prepare
     Use : Called before segue to table view
     Parameters :   segue : segue.destination is the table view controller
                            we're showing,
                    sender: object that initiated the segue.
     Return Type : None
     Return Value : None
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Segue to table view
        if segue.destination is TableView {
            // temp is table view
            let temp = segue.destination as? TableView
            // Load data to table view
            temp?.tab_url = self.tab_url
            temp?.thumbnail = self.thumbnail
            // Reload table
            temp?.tableView.reloadData()
        }
    }
}

