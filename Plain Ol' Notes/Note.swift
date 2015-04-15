//
//  Note.swift
//  Plain Ol' Notes
//
//  Created by Toni De Mingo on 15/4/15.
//  Copyright (c) 2015 Toni De Mingo. All rights reserved.
//

import UIKit

class Note: NSObject {
    var date:String
    var note:String
    
    override init() {
        date = NSDate().description
        note = ""
    }
   
}
