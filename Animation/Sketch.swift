//
//  Sketch.swift
//  Animation
//
//  Created by Russell Gordon on 2015-12-05.
//  Copyright © 2015 Royal St. George's College. All rights reserved.
//

import Foundation

class Sketch : NSObject {
    
    // NOTE: Every sketch must contain an object of type Canvas named 'canvas'
    //       Therefore, the line immediately below must always be present.
    let canvas : EnhancedCanvas
    
    // Create the basic L-systems
    let kochSnowflake : LindenmayerSystem
    
    // Create the visualizations of the snowflake
    let smallKochSnowflake : VisualizedLindenmayerSystem
    let mediumKochSnowflake : VisualizedLindenmayerSystem
    
    // This runs once, equivalent to setup() in Processing
    override init() {
        
        // Create a new canvas
        canvas = EnhancedCanvas(width: 500, height: 500)
        
        // Set up a Koch snowflake
        kochSnowflake = LindenmayerSystem(angle: 15,
                                          axiom: "+F-F+F-F+F-F",
                                          generations: 3,
                                          rules: ["F" : ["F[+F]F[-F]"]])
        
        // Visualize this as a small snowflake
        smallKochSnowflake = VisualizedLindenmayerSystem(with: kochSnowflake,
                                                         length: 270,
                                                         reduction: 3,
                                                         x: 150,
                                                         y: 175,
                                                         direction: 0,
                                                         colours: ["1": Colour(hue: 30, saturation: 30, brightness: 40), "2": Colour(hue: 0, saturation: 80, brightness: 90), "3": Colour(hue: 120, saturation: 80, brightness: 90)])
        
        // Visualize this as a small snowflake
        mediumKochSnowflake = VisualizedLindenmayerSystem(with: kochSnowflake,
                                                          length: 270,
                                                          reduction: 3,
                                                          x: 150,
                                                          y: 175,
                                                          direction: 0,
                                                          // DARK GREEN: hue: 100, saturation: 100, brightness: 80
                                                          colours: ["1": Colour(hue: 100, saturation: 100, brightness: 80), "2": Colour(hue: 45, saturation: 100, brightness: 50), "3": Colour(hue: 120, saturation: 80, brightness: 90)])
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 60
        
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        //canvas.saveState()
        
        // Render the current system
        //canvas.renderAnimated(systems: [smallKochSnowflake, mediumKochSnowflake], generations: [6, 2])
        canvas.renderAnimated(systems: [mediumKochSnowflake], generations: [6])

        
        //canvas.restoreState()
        
    }
    
    // Respond to the mouseDown event
    func mouseDown() {
        
        
    }
    
}
