//
//  RMAUtilities.swift
//  RijksMuseumArt
//
//  Created by Markandaiya Harsha on 25/08/18.
//  Copyright © 2018 markandaiya. All rights reserved.
//

import Foundation
import UIKit

typealias rnBlankComplition = () -> ()

// auth related static strings
let userNameEmpty = "Username should not be empty"
let passwordEmpty = "Password should not be empty"
let authenticationFailure = "Authentication failed"
let checkBoxFailure = "Checkbox should be check"
let userExists = "User already exist"
let viewNames = ["Home", "Profile"]

// user related static strings
let userName = "userName"
let password = "password"

public func dlPrint<Template>(object:  @autoclosure () -> Template,  file: String = #file,  functionName: String = #function, lineNum: Int = #line)
{
    #if DEBUG
    var fileName = "Unknown"
    if
        let path = file.components(separatedBy:"/").last,
        let name = path.components(separatedBy:".").first
    {
        fileName = name
    }
    
    print( "\n\(fileName).\(functionName)[\(lineNum)]: \(object())\n", terminator: "")
    
    #endif
    
}

public func mainScreenBound () -> CGRect {
    
    return UIScreen.main.bounds
}

public func mainScreenHeight () -> CGFloat {
    
    return mainScreenBound().size.height
}

public func mainScreenWidth () -> CGFloat {
    
    return mainScreenBound().size.width
}


func delayOnMainThread(delay: Double, clousre: @escaping rnBlankComplition) {
    
    if delay == 0 {
        
        if Thread.isMainThread {
            clousre()
        }
        else {
            
            DispatchQueue.main.async {
                clousre()
            }
        }
    }
    else {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: { clousre()})
    }
}

func dispatchInBackground(clousre: @escaping rnBlankComplition) {
    
    DispatchQueue.global(qos: .background).async(execute: clousre)
    
}

func dispatchOnQueue(withId:Int, clousre: @escaping rnBlankComplition) {
    let queue1 = DispatchQueue(label: "com.ranker.queue\(withId)", qos: DispatchQoS.userInitiated)
    
    queue1.async {
        clousre()
    }
    //    DispatchQueue.global(qos: .background).async(execute: clousre)
    
}



//MARK: userdefaults

func saveUserData(userData:[String:String])->Bool{
    if var users = getAllUsers() {
        if !users.contains{ $0[userName] == userData[userName]! } {
            users.append(userData)
            saveAllUsers(users: users)
            
        }
        else {
         return false
        }
    }
    else {
        var users:[[String:String]] = [[:]]
        users.append(userData)
        saveAllUsers(users: users)
    }
    return true
}
func saveAllUsers(users:[[String:String]])->Void{
    UserDefaults.standard.set(users, forKey: "allUsers")
}


func verifyUserData(user:[String:String])->Bool{
    if let users = getAllUsers() {
        if users.contains(where: { $0 == user }) {
           return true
        }
        else {
            return false
        }
    }
    return false
}
func getAllUsers() -> [[String:String]]? {
    return  UserDefaults.standard.array(forKey: "allUsers") as? [[String:String]]
}
func saveCurrentUser(user:[String:String]){
    UserDefaults.standard.set(user, forKey: "currentUser")
}
func getCurrentUser()->[String:String]?{
    return UserDefaults.standard.value(forKey: "currentUser") as? [String:String]
}

func saveAccessToken(token:String , userId:Int, userType:String)
{
    
}

func clearCurrentUser()
{
    UserDefaults.standard.removeObject(forKey: "currentUser")
}

func clearUserDetailsForLogout()
{
   
}

func isUserLoggedIn() -> Bool
{
   return false
}

func showAlert(on ViewController:UIViewController,with title:String, and message:String) -> Void{
   let alert =  UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "Ok", style: .destructive) { (action) in
        
    }
    alert.addAction(action)
    ViewController.present(alert, animated: true) {
        
    }
}


