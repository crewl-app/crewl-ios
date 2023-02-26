//
//  Logger.swift
//  Crewl
//
//  Created by Kaan on 21.02.2023.
//

import Foundation

enum Logger {
    enum LogLevel {
        case info
        case warning
        case error
        
        fileprivate var prefix: String {
            switch self {
            case .info: return "Info"
            case .warning: return "Warning"
            case .error: return "Error"
            }
        }
    }
    
    struct Context {
        let file: String
        let function: String
        let line: Int
        var description: String {
            return "\((file as NSString).lastPathComponent): at \(line), on \(function)"
        }
    }
    
    static func i(_ string: StaticString, isContextShown: Bool = true, file: String = #file, function: String = #function, line: Int = #line) {
        let context = Context(file: file, function: function, line: line)
        Logger.handle(level: .info, str: string.description, isContextShown: isContextShown, context: context)
    }
    
    fileprivate static func handle(level: LogLevel, str: String, isContextShown: Bool, context: Context) {
        let logComponents = ["[\(level.prefix)]", str]
        var fullString = logComponents.joined(separator: " ")
        
        if isContextShown {
            fullString += " + \(context.description)"
        }
        
        #if DEBUG
        print(fullString)
        #endif
    }
}
