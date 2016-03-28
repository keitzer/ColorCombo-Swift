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
            context("when passed a marker and an identical chip", {
                it("unlocks the panel") {
                    let panel = SecurityPanel()
                    let chipsArray = ["blue,green", "blue,green"]
                    let returnedOrder = panel.unlockPanelWithChipsAndMarker(chipsArray)
                    
                    expect(returnedOrder).to(equal("blue,green"))
                }
            })
            
            context("when passed a marker color and a non-matching chip", {
                it("cannot unlock panel") {
                    let panel = SecurityPanel()
                    let chipsArray = ["blue,green", "blue,red"]
                    let returnedOrder = panel.unlockPanelWithChipsAndMarker(chipsArray)
                    
                    expect(returnedOrder).to(equal("Cannot unlock master panel"))
                }
            })
        }
    }
}
