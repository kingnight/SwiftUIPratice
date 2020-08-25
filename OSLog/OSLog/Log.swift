//
//  Log.swift
//  OSLog
//
//  Created by kai jin on 2020/8/11.
//

import Foundation
import os

//class LogManager {
//    static let shared:LogManager = LogManager()
//    private let logger: Logger
//    private init() {
//        let bundleId = Bundle.main.bundleIdentifier
//        logger = Logger(subsystem: bundleId ?? "", category: "")
//    }
//
//    func log(_ message: OSLogMessage){
//        self.logger.log(message)//Argument must be a string interpolation
//    }
//}

extension Logger{
    static let bundleID = Bundle.main.bundleIdentifier!
    
    static let lifecycle = Logger(subsystem: bundleID, category: "lifecycle")
    
    static let statics = Logger(subsystem: bundleID, category: "statics")
    
    static func makeLogger(file:String = #file,
                           method:String = #function,
                           line:Int = #line) -> Logger{
        let log = Logger(subsystem: bundleID, category: "\((file as NSString).lastPathComponent)[\(line)],\(method)")
        return log
    }
}

extension Logger{
    static let shared = Logger()
    
    private var logFile: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let dateString = formatter.string(from: Date())
        let fileName = "\(dateString).log"
        return documentsDirectory.appendingPathComponent(fileName)
    }

    func writeToFile(_ message: String) {
        guard let logFile = logFile else {
            return
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let timestamp = formatter.string(from: Date())
        guard let data = (timestamp + ": " + message + "\n").data(using: String.Encoding.utf8) else { return }

        if FileManager.default.fileExists(atPath: logFile.path) {
            if let fileHandle = try? FileHandle(forWritingTo: logFile) {
                fileHandle.seekToEndOfFile()
                fileHandle.write(data)
                fileHandle.closeFile()
            }
        } else {
            try? data.write(to: logFile, options: .atomicWrite)
        }
    }
}


