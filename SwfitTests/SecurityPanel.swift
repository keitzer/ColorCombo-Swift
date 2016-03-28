//
//  SecurityPanel.swift
//  SwfitTests
//
//  Created by Alex Ogorek on 3/28/16.
//  Copyright © 2016 swifd. All rights reserved.
//

import Foundation

class SecurityPanel {
    
    func unlockPanelWithChipsAndMarker(chipsAndMarkerArray: [String]) -> String {
        if chipsAndMarkerArray.count < 2 {
            return "Cannot unlock master panel"
        }
        else if chipsAndMarkerArray.count == 2 && chipsAndMarkerArray[0] == chipsAndMarkerArray[1] {
            return chipsAndMarkerArray[1]
        }
        else {
            
            let markerColors = chipsAndMarkerArray[0].componentsSeparatedByString(",")
            var chipsArray = chipsAndMarkerArray
            chipsArray.removeAtIndex(0)
            
            for chip in chipsArray {
                let chipColors = chip.componentsSeparatedByString(",")
                
                if chipColors[0] == markerColors[0] {
                    var remainingChips = chipsArray
                    remainingChips.removeAtIndex(0)
                    
                    for otherChip in remainingChips {
                        let otherChipColors = otherChip.componentsSeparatedByString(",")
                        if otherChipColors[0] == chipColors[1] && otherChipColors[1] == markerColors[1] {
                            return "\(chip) \(otherChip)"
                        }
                        else {
                            return "Cannot unlock master panel"
                        }
                    }
                }
            }
        }
        
        //when it doubt, return "cannot unlock"
        return "Cannot unlock master panel"
    }
}

