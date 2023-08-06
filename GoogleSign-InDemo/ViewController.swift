//
//  ViewController.swift
//  GoogleSignInDemo
//
//  Created by TEJASWINI KADAM on 02/08/23.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {
    //MARK:  @IBOutlet
    @IBOutlet weak var btnGoogleSignIn: UIButton!
    @IBOutlet weak var btnGoogleSignOut: UIButton!
    @IBOutlet weak var lblSignInStatus: UILabel!
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

//MARK: @IBAction
extension ViewController {
    @IBAction func btnGoogleSingInDidTap(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            self.btnGoogleSignIn.isHidden = false
            self.btnGoogleSignOut.isHidden = true
            self.lblSignInStatus.text = "Welcome To GoogleSignIn! To continue with GoogleSignIn please hit below button. "
            guard error == nil else { return }

          // If sign in succeeded, display the app's main content View.
            guard let signInResult = signInResult else { return }
            let user = signInResult.user

            let emailAddress = user.profile?.email

            let fullName = user.profile?.name
            let givenName = user.profile?.givenName
            let familyName = user.profile?.familyName

            let profilePicUrl = user.profile?.imageURL(withDimension: 320)
            
            self.btnGoogleSignIn.isHidden = true
            self.btnGoogleSignOut.isHidden = false
            self.lblSignInStatus.text = "Hi \(fullName ?? "")"
             
        }
    }
    
    @IBAction func btnGoogleSignOutDidTap(_ sender: Any) {
        GIDSignIn.sharedInstance.signOut()
    }
}
