//
//  NSObjectExtention.swift
//  SlideshowApp
//
//  Created by yasuhito on 2016/07/17.
//  Copyright © 2016年 yasuhito.nagata. All rights reserved.
//

import Foundation

extension NSObject {
    class var className: String? {
        get {
            if let last = NSStringFromClass(self).componentsSeparatedByString(".").last {
                return last
            } else {
                return nil
            }
        }
    }
    
    var className: String? {
        get {
            return self.dynamicType.className
        }
    }
}