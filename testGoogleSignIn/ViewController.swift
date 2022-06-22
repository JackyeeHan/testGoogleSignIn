//
//  ViewController.swift
//  testGoogleSignIn
//
//  Created by 黃柏瀚 on 2022/6/22.
//

import UIKit
import GoogleSignIn
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user{
                
                let displayname = user.displayName ?? ""
                print("登入狀態\(displayname)")
                self.status.text = "歡迎:\(displayname)"
            }else{
                print("登出狀態")
                self.status.text = "請登入"
            }
        
    }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        }
    
    
//    @IBAction func signIN(_ sender: Any) {
//        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//
//        // Create Google Sign In configuration object.
//        let config = GIDConfiguration(clientID: clientID)
//
//        // Start the sign in flow!
//        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
//            if let error = error {
//                // ...
//                print(error.localizedDescription)
//                return
//            }
//
//            guard
//                let authentication = user?.authentication,
//                let idToken = authentication.idToken
//            else {
//                return
//            }
//
//            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
//                                                           accessToken: authentication.accessToken)
//
//            Auth.auth().signIn(with: credential) { result, error in
//                if error != nil{
//                    print(error?.localizedDescription)
//                }
//            }
//
//            // ...
//        }
//
//    }
    
    @IBAction func signButton(_ sender: UIButton) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            if let error = error {
                // ...
                print(error.localizedDescription)
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { result, error in
                if error != nil{
                    print(error?.localizedDescription)
                }
            }
            
            // ...
        }
        
        
    }
    
    
    @IBAction func signOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        }catch{
            print(error.localizedDescription)
        }

    }
    
    }
    

        
    
   

