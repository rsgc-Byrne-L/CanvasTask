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
    let vine : LindenmayerSystem
    let bush : LindenmayerSystem
    let tree : LindenmayerSystem
    
    // Create the visualizations of the snowflake
    let mediumLeaningVine : VisualizedLindenmayerSystem
    let mediumBush : VisualizedLindenmayerSystem
    let treeGreen : VisualizedLindenmayerSystem
    
    // This runs once, equivalent to setup() in Processing
    override init() {
        
        // Create a new canvas
        canvas = EnhancedCanvas(width: 500, height: 500)
        
        // Set up a Koch snowflake
        vine = LindenmayerSystem(angle: 15,
                                          axiom: "+F-F+F-F+F-F",
                                          generations: 3,
                                          rules: ["F" : ["2F[+F]1F[-F]"]])
        
        bush = LindenmayerSystem(angle: 10,
                                 axiom: "F+F+F+F+F+F+F",
                                 generations: 5,
                                 rules: ["F" : ["1F++++F"]])
        
        tree = LindenmayerSystem(angle: 25,
                                 axiom: "F",
                                 generations: 5,
                                 rules: ["F" : ["F[-F+F]F[+F-F]"]])
        
        // Visualize this as a small snowflake
        mediumLeaningVine = VisualizedLindenmayerSystem(with: vine,
                                                         length: 150,
                                                         reduction: 3,
                                                         x: 150,
                                                         y: 125,
                                                         direction: 70,
                                                         colours: ["1": Colour(hue: 100, saturation: 100, brightness: 80), "2": Colour(hue: 45, saturation: 100, brightness: 50), "3": Colour(hue: 120, saturation: 80, brightness: 90)])
        
        // Visualize this as a small snowflake
        mediumBush = VisualizedLindenmayerSystem(with: bush,
                                                          length: 270,
                                                          reduction: 3,
                                                          x: 200,
                                                          y: 130,
                                                          direction: 70,
                                                          // DARK GREEN: hue: 100, saturation: 100, brightness: 80
                                                          colours: ["1": Colour(hue: 100, saturation: 100, brightness: 80), "2": Colour(hue: 45, saturation: 100, brightness: 50), "3": Colour(hue: 120, saturation: 80, brightness: 90)])
        
        treeGreen = VisualizedLindenmayerSystem(with: tree,
                                                 length: 400,
                                                 reduction: 3,
                                                 x: 300,
                                                 y: 250,
                                                 direction: 90,
                                                 // DARK GREEN: hue: 100, saturation: 100, brightness: 80
                                                 colours: ["1": Colour(hue: 100, saturation: 100, brightness: 80), "2": Colour(hue: 45, saturation: 100, brightness: 50), "3": Colour(hue: 120, saturation: 80, brightness: 90)])
    
        let ground = Gradient(on: canvas)
        ground.makeGradient(lowerLeftX: 0, lowerLeftY: 0, from: 40, to: 60, brightness: 75)
        
        let sky = Gradient(on: canvas)
        sky.makeGradient(lowerLeftX: 0, lowerLeftY: 180, from: 210, to: 200)
        
        
        // The frame rate can be adjusted; the default is 60 fps
        canvas.framesPerSecond = 60
        
    }
    
    // Runs repeatedly, equivalent to draw() in Processing
    func draw() {
        
        //canvas.saveState()
        
        // Render the current system
        //canvas.renderAnimated(systems: [smallKochSnowflake, mediumKochSnowflake], generations: [6, 2])
        canvas.renderAnimated(systems: [mediumLeaningVine, mediumBush, treeGreen], generations: [3, 3, 4])

        
        //canvas.restoreState()
        
    }
    
    // Respond to the mouseDown event
    func mouseDown() {
        
        
    }
    
}
