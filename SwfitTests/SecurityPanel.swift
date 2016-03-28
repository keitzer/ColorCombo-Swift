//
//  SecurityPanel.swift
//  SwfitTests
//
//  Created by Alex Ogorek on 3/28/16.
//  Copyright © 2016 swifd. All rights reserved.
//

import Foundation

class SecurityPanel {
    
    var markerColors = [String]()
    
    func unlockPanelWithChipsAndMarker(chipsAndMarkerArray: [String]) -> String {
        if chipsAndMarkerArray.count < 2 {
            return "Cannot unlock master panel"
        }
        else {
            
            markerColors = chipsAndMarkerArray[0].componentsSeparatedByString(",")
            var chipsArray = chipsAndMarkerArray
            chipsArray.removeAtIndex(0)
            
            let solution = getCombinationWithRemainingChips(chipsArray, previousColor: markerColors[0])
            
            return solution
        }
    }
    
    func getCombinationWithRemainingChips(remainingChips: [String], previousColor: String) -> String {
        if remainingChips.count == 1 {
            let chipColors = remainingChips[0].componentsSeparatedByString(",")
            if chipColors[0] == previousColor && chipColors[1] == markerColors[1] {
                return remainingChips[0]
            }
            else {
                return "Cannot unlock master panel"
            }
        }
        
        var solution = ""
        var solutionFound = false
        
        for chip in remainingChips {
            solution = ""
            let chipColors = chip.componentsSeparatedByString(",")
            
            if chipColors[0] == previousColor {
                var newChipArray = remainingChips
                newChipArray.removeAtIndex(remainingChips.indexOf(chip)!)
                
                solution = chip + " " + getCombinationWithRemainingChips(newChipArray, previousColor: chipColors[1])
                
                if !solution.containsString("Cannot unlock master panel") {
                    solutionFound = true
                    break
                }
            }
        }
        
        if solutionFound {
            return solution
        }
        else {
            return "Cannot unlock master panel"
        }
    }
}

