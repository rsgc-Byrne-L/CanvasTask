//
//  VisualizedLindenmayerSystem.swift
//  Canvas
//
//  Created by Russell Gordon on 5/3/17.
//  Copyright © 2017 Royal St. George's College. All rights reserved.
//

import Foundation

public class VisualizedLindenmayerSystem : LindenmayerSystem {
    
    public struct StateOfSystem {
        
        var systemX: Float
        var systemY: Float
        var systemAngle: Degrees
        
        init(systemX: Float, systemY: Float, systemAngle: Degrees) {
            
            self.systemX = systemX
            self.systemY = systemY
            self.systemAngle = systemAngle
        }
        
        
    }
    
    var initialLength : Float               // initial line segment length
    var reduction : Float                   // reduction factor
    var x : Float                           // initial horizontal position of turtle
    var y : Float                           // initial vertical position of turtle
    var direction : Int                     // initial direction turtle faces (degrees)
    var currentLength : Float               // current line segment length
    var animationPosition = 0               // tracks current character being interpreted when system is animated
    var currentAngle : Degrees              // tracks current angle depending on the current direction
    var colours : [String : Colour]         // declares variable for colours
    var systemStack = [StateOfSystem]()     // stack for the system, can take out and put in from the top
    var currentColour : Colour              // current colour
    
    public init(with providedSystem: LindenmayerSystem,
                length: Float,
                reduction: Float,
                x: Float,
                y: Float,
                direction: Int,
                colours : [String : Colour]) {
        
        // Initialize stored properties
        self.initialLength = length
        self.reduction = reduction
        self.x = x
        self.y = y
        self.direction = direction
        self.currentLength = self.initialLength
        self.currentAngle = Degrees(direction)
        self.colours = colours
        self.currentColour = Colour(hue: 0, saturation: 0, brightness: 0)
        super.init(with: providedSystem)
    }
    
    
}
