//
//  MainPageViewController.swift
//  EasyLunch
//
//  Created by Hayk Sakulyan on 28.04.23.
//

import UIKit
import FirebaseAuth
import SnapKit

class MainPageViewController: UIViewController {
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        getUserData()
    }
    
    func getUserData() {
        FirebaseStorageManager.shared.readUserData { result in
            let userID = Auth.auth().currentUser?.uid
            switch result {
            case .success(let userData):
                self.lastName.text = userData.firstName
                self.lastName.text! += userData.lastName
                
                print(userData.firstName)
            case .failure(.userNotFound):
                print("")
            }
        }
    }
    
    func moveToSignIn() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
    
    func signOut () -> Bool {
        if FirebaseStorageManager.shared.signOut() {
            return true
        }
        return false
    }
    
    
    @IBAction func signUotAction(_ sender: UIButton) {
        if signOut () {
            moveToSignIn()
        } else {
            print("chexav aper")
        }
        
        
    }
}
