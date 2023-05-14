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
    
    func writeUserData(firstName: String, lastName: String, userID: String) {
            ref.child("Users").child(userID).setValue(["firstName" : firstName,
                                                       "lastName" : lastName])
    }
    
    func readUserData(callBack: @escaping(_ result: Result<UserModel, UserNotFound>) -> Void) {
        if let userID = Auth.auth().currentUser?.uid {
            ref.child("Users").child(userID).observeSingleEvent(of: .value, with: { snapShot in
                if let snap = snapShot.value as? NSDictionary {

                    let firstName = (snap["firstName"] as? String) ?? ""
                    let lastName = (snap["lastName"] as? String) ?? ""
                    let user = UserModel(firstName: firstName, lastName: lastName)
                    callBack(.success(user))
                } else {
                    callBack(.failure(.userNotFound))
                }
            }){ error in
                print(error.localizedDescription)
            }
        }
    }
    func signOut() -> Bool {
        do {
            try Auth.auth().signOut()
            return true
        } catch {
            let error = error.localizedDescription
            print(error)
        }
        return false
    }
    
    enum UserNotFound: Error {
        case userNotFound
    }
}
