//
//  Utility.swift
//  BhadaExpress
//
//  Created by Anup Gupta on 16/01/21.
//

import Foundation

public func debugLog(object: Any? = nil, functionName: String = #function, fileName: String = #file, lineNumber: Int = #line) {
  #if DEBUG
    let className = (fileName as NSString).lastPathComponent
    if (object != nil) {
        print("*** debugLogger: <\(className)> \(functionName) [#\(lineNumber)] | \(object!)")
    } else {
        print("*** debugLogger: <\(className)> \(functionName) [#\(lineNumber)]")
    }
  #endif
}
