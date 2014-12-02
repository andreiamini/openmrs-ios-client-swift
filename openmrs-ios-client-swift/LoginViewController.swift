//
//  LoginViewController.swift
//  openmrs-ios-client-swift
//
//  Created by Liza Amini on 01/12/2014.
//  Copyright (c) 2014 openmrs. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController, NSURLConnectionDataDelegate {

    @IBOutlet weak var hostAddress: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func login(sender: AnyObject) {
        println("hi");
        var url = NSURL(string:  hostAddress.text);
        var request = NSURLRequest(URL: url!)
        var connection = NSURLConnection(request: request, delegate: self, startImmediately: true)
        
    }
    
    func connection(connection:NSURLConnection!, willSendRequestForAuthenticationChallenge challenge:NSURLAuthenticationChallenge!) {
        
        if challenge.previousFailureCount > 1 {
            
        } else {
            let creds = NSURLCredential(user: usernameTextField.text, password: passwordTextField.text, persistence: NSURLCredentialPersistence.None)
            challenge.sender.useCredential(creds, forAuthenticationChallenge: challenge)
            
        }
        
    }
    
    func connection(connection:NSURLConnection!, didReceiveResponse response: NSURLResponse) {
        let status = (response as NSHTTPURLResponse).statusCode
        println("Status code: \(status)")
        
        println("\(response)")
        
        println(status);
        
        if(status==200) {
            self.performSegueWithIdentifier("mainMenu", sender: self)
            println("yay 200!")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }  
}