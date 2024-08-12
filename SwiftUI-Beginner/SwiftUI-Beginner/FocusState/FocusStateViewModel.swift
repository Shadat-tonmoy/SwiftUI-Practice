//
//  FocusStateViewModel.swift
//  SwiftUI-Beginner
//
//  Created by Shadat Mufakhkhar Tonmoy on 31/7/24.
//

import SwiftUI

class FocusStateViewModel : ObservableObject {
    
    @Published var userName : String = ""
    
    @Published var password : String = ""
    
    @Published var invalidUserName : Bool = false
    @Published var invalidPassword : Bool = false
    
    
    
    func validateField() {
        
        invalidPassword = false
        invalidUserName = false
        
        if userName.isEmpty {
            invalidUserName = true
        } else if password.isEmpty {
            invalidPassword = true
        } 
        
        

    }
    
    
    
    
}

