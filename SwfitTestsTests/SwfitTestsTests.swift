//
//  SwfitTestsTests.swift
//  SwfitTestsTests
//
//  Created by Alex Ogorek on 3/28/16.
//  Copyright © 2016 swifd. All rights reserved.
//

@testable import SwfitTests

import XCTest
import Quick
import Nimble

class SwfitTestsTests: QuickSpec {
    override func spec() {
        describe("Security Panel") {
            let panel = SecurityPanel()
            
            context("when passed a marker and an identical chip", {
                it("unlocks the panel") {
                    let chipsArray = ["blue,green", "blue,green"]
                    let returnedOrder = panel.unlockPanelWithChipsAndMarker(chipsArray)
                    
                    expect(returnedOrder).to(equal("blue,green"))
                }
            })
            
            context("when passed a marker and 2 chips", { 
                it("should unlock when chips align") {
                    let chipsArray = ["blue,green", "red,green", "blue,red"]
                    let returnedOrder = panel.unlockPanelWithChipsAndMarker(chipsArray)
                    
                    expect(returnedOrder).to(equal("blue,red red,green"))
                }
                
                it("should NOT unlock when chips DON'T align") {
                    let chipsArray = ["blue,green", "blue,red", "red,purple"]
                    let returnedOrder = panel.unlockPanelWithChipsAndMarker(chipsArray)
                    
                    expect(returnedOrder).to(equal("Cannot unlock master panel"))
                }
            })
            
            context("when passed a marker and 4 chips", {
                it("should unlock when chips align") {
                    let chipsArray = ["blue,green", "red,purple", "blue,red", "purple,yellow", "yellow,green"]
                    let returnedOrder = panel.unlockPanelWithChipsAndMarker(chipsArray)
                    
                    expect(returnedOrder).to(equal("blue,red red,purple purple,yellow yellow,green"))
                }
                
                it("should NOT unlock when chips DON'T align") {
                    let chipsArray = ["blue,green", "red,purple", "blue,red", "purple,yellow", "yellow,red"]
                    let returnedOrder = panel.unlockPanelWithChipsAndMarker(chipsArray)
                    
                    expect(returnedOrder).to(equal("Cannot unlock master panel"))
                }
            })
            
            context("EX 1: when passed a marker and 5 misaligned chips", { 
                it("should not unlock panel") {
                    let chipsArray = ["blue,green", "blue,yellow", "red,orange", "red,green", "yellow,red", "orange,purple"]
                    let returnedOrder = panel.unlockPanelWithChipsAndMarker(chipsArray)
                    
                    expect(returnedOrder).to(equal("Cannot unlock master panel"))
                }
            })
            
            context("EX 2: when passed a marker and 5 aligned chips", {
                it("should not unlock panel") {
                    let chipsArray = ["blue,green", "blue,yellow", "red,green", "red,orange", "yellow,red", "orange,red"]
                    let returnedOrder = panel.unlockPanelWithChipsAndMarker(chipsArray)
                    
                    expect(returnedOrder).to(equal("blue,yellow yellow,red red,orange orange,red red,green"))
                }
            })
            
            context("EX 3: when passed a marker and 8 aligned chips", {
                it("should not unlock panel") {
                    let chipsArray = ["blue,green", "blue,green", "blue,yellow", "green,yellow", "orange,red", "red,green", "red,orange", "yellow,blue", "yellow,red"]
                    let returnedOrder = panel.unlockPanelWithChipsAndMarker(chipsArray)
                    
                    expect(returnedOrder).to(equal("blue,green green,yellow yellow,blue blue,yellow yellow,red red,orange orange,red red,green"))
                }
            })
            
            context("when passed a marker color and a non-matching chip", {
                it("cannot unlock panel") {
                    let chipsArray = ["blue,green", "blue,red"]
                    let returnedOrder = panel.unlockPanelWithChipsAndMarker(chipsArray)
                    
                    expect(returnedOrder).to(equal("Cannot unlock master panel"))
                }
            })
        }
    }
}
