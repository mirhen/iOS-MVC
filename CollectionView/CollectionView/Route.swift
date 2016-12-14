//
//  Route.swift
//  Cycl
//
//  Created by Alex Aaron Peña on 12/10/16.
//  Copyright © 2016 Alex Aaron Peña. All rights reserved.
//

import Foundation


class Route {
    var eta: Int
    var routeType: String
    var elevationTotal: Int = 0
    
    
    init(routeType: String , eta: Int, elevationTotal: Int) {
        self.eta = eta
        self.routeType = routeType
        self.elevationTotal = elevationTotal
    }
    

    
    
}
