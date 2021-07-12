//
//  LAuthentication.swift
//  LAuthentication
//
//  Created by DambertMunoz on 12/07/21.
//

import Foundation
import LocalAuthentication

public class LAuthentication{
    
    public static var shared = LAuthentication()
    
    public init(){
        
    }
    
    public func evaluatePolicy(reason: String, complete: @escaping ((Bool)->()) , rejected: @escaping((NSError?)->Void) ){
        
           let context = LAContext()
           var error: NSError?

           if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {

               context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                   [weak self] success, authenticationError in

                   DispatchQueue.main.async {
                       if success {
                        complete(true)
                       } else {
                        
                        complete(false)
                    
                       }
                   }
               }
           } else {
                rejected(error)
           }
    }
    
    
}
