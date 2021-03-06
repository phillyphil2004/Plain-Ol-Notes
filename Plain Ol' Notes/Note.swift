//
//  Note.swift
//  Plain Ol' Notes
//
//  Created by Toni De Mingo on 15/4/15.
//  Copyright (c) 2015 Toni De Mingo. All rights reserved.
//

import UIKit

var allNotes:[Note] = []
var currentNoteIndex:Int = -1
var noteTable:UITableView?

let kAllNotes:String = "notes"

class Note: NSObject {
    var date:String
    var note:String
    
    override init() {
        date = NSDate().description
        note = ""
    }
    
    func dictionary() ->NSDictionary {
        return ["note":note,"date":date]
    }
    
    class func saveNotes(){
        var aDictionaries:[NSDictionary] = []
        for var i:Int = 0; i < allNotes.count; i++ {
        aDictionaries.append(allNotes[i].dictionary())
        }
    NSUserDefaults.standardUserDefaults().setObject(aDictionaries, forKey: kAllNotes)
    }
    
    class func loadNotes(){
        var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var savedData:[NSDictionary]? = defaults.objectForKey(kAllNotes) as? [NSDictionary]
        if let data:[NSDictionary] = savedData {
            for var i:Int = 0; i < data.count; i++ {
                var n:Note = Note()
                n.setValuesForKeysWithDictionary(data[i] as [NSObject : AnyObject])
                allNotes.append(n)
            }
        }
    }
}
