//
//  File.swift
//  
//
//  Created by Sridhar Reddy on 8/18/21.
//

import Foundation

class args {
    public func getArgs() -> Array<Any> {
        var givenArgs: Array<Any> = CommandLine.arguments;
        givenArgs.remove(at: 0);
        return givenArgs
    }
    
}
