//
//  MyController.swift
//  DateFormatterBug
//
//  Created by Philip Guerrant on 12/22/14.
//  Copyright (c) 2014 bug. All rights reserved.
//

import Foundation
import AppKit

class MyController: NSArrayController, NSTableViewDelegate, NSTextFieldDelegate {
    
    class MyEntity: NSObject {
        dynamic var name: String
        dynamic var date: NSDate
        dynamic var number: NSDecimalNumber
        init(name: String, date: NSDate, number: NSDecimalNumber) {
            self.name = name
            self.date = date
            self.number = number
        }
    }
    
    override func prepareContent() {
        self.content = [
            MyEntity(name: "Foo", date: NSDate(string: "2014-12-22 00:00:00 +0000")!, number: NSDecimalNumber(string: "100.56")),
            MyEntity(name: "Bar", date: NSDate(string: "2014-12-23 00:00:00 +0000")!, number: NSDecimalNumber(string: "196.26")),
            MyEntity(name: "Baz", date: NSDate(string: "2014-12-24 00:00:00 +0000")!, number: NSDecimalNumber(string: "523.00"))
        ]
    }
    
    override func controlTextDidEndEditing(obj: NSNotification) {
        println("did end editing")
    }
    
    func control(control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
        println("should end editing")
        return true
    }
    
}
