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
        
        if chipsAndMarkerArray[0] == chipsAndMarkerArray[1] {
            return chipsAndMarkerArray[1]
        }
        else {
            return "Cannot unlock master panel"
        }
    }
}

