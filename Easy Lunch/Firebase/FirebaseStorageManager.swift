//
//  FirebaseStorageManager.swift
//  EasyLunch
//
//  Created by Hayk Sakulyan on 24.04.23.
//

import UIKit
import Firebase
import FirebaseAuth

class FirebaseStorageManager: NSObject {
    
    static let shared = FirebaseStorageManager()
    
    private var ref: DatabaseReference!
    
    override init() {
        ref = Database.database().reference()
    }
    
    func registerUser(email: String, password: String, callBack: @escaping(_ result: Result<AuthDataResult?, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error == nil {
                callBack(.success(result))
            } else {
                callBack(.failure(error!))
            }
        }
    }
    func loginUser(email: String, password: String, callBack: @escaping(_ result: Result<AuthDataResult?, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error == nil {
                callBack(.success(result))
            } else {
                callBack(.failure(error!))
            }
        }
    }
    func writeUserData(firstname: String, lastName: String, userID: String) {
            ref.child("Users").child(userID).setValue(["firstname" : firstname,
                                                       "lastName" : lastName])
    }
    
    func readUserData(callBack: @escaping(_ result: Result<UserModel, Error>) -> Void) {

        if let userID = Auth.auth().currentUser?.uid {

            ref.child("Users").child(userID).observeSingleEvent(of: .value) { snapShot, error in

                if let snap = snapShot.value as? NSDictionary {

                    let firstname = (snap["firstName"] as? String) ?? ""
                    let lastName = (snap["lastName"] as? String) ?? ""
                    var user = UserModel(firstname: firstname, lastName: lastName)
                    callBack(.success(user))
                } else {
                    callBack(.failure(error as! Error))
                }

            }
        }
    }
    
    func readUserData2(callBack: @escaping(_ result: Result<UserModel, Error>) -> Void) {
        if let userID = Auth.auth().currentUser?.uid {
            
            ref.child("Users").child(userID).observeSingleEvent(of: .value, with: { snapShot in
                if let snap = snapShot.value as? NSDictionary {

                    let firstname = (snap["firstName"] as? String) ?? ""
                    let lastName = (snap["lastName"] as? String) ?? ""
                    var user = UserModel(firstname: firstname, lastName: lastName)
                    
                    callBack(.success(user))
                } else {
//                    callBack(.failure())
                }
                
                
            }){ error in
                print(error.localizedDescription)
            }
        }
    }
    
    
}
