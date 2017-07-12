//
//  Parser.swift
//  SplashBuddy
//
//  Created by Francois Levaux on 02.03.17.
//  Copyright © 2017 François Levaux-Tiffreau. All rights reserved.
//

import Foundation

class Parser: NSObject {
    
    static let sharedInstance = Parser()
    
    override init() {
        super.init()
        
        // Setup Timer to parse log
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(readTimer), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func readTimer() -> Void {
        
        DispatchQueue.global(qos: .background).async {
            
            guard let logFileHandle1 = Preferences.sharedInstance.logFileHandle1 else {
                // Hopefully this is already handled by Preferences class
                return
            }
            guard let logFileHandle2 = Preferences.sharedInstance.logFileHandle2 else {
                // Hopefully this is already handled by Preferences class
                return
            }
            
            guard let linesLog1 = logFileHandle1.readLines() else {
                return 
            }
            guard let linesLog2 = logFileHandle2.readLines() else {
                return
            }
            let lines = linesLog1 + linesLog2
            
            for line in lines {
                if let software = Software(from: line) {
                    
                    DispatchQueue.main.async {
                        SoftwareArray.sharedInstance.array.modify(with: software)
                        
                    }
                    
                }
            }
            
        }
        
    }
}
