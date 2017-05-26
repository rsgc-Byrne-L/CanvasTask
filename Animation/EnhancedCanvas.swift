import Foundation

public class EnhancedCanvas : Canvas {
    
    public func render(system s : VisualizedLindenmayerSystem) {
        
        render(system: s, generation: s.n)
        
    }
    
    public func render(system : VisualizedLindenmayerSystem, generation : Int) {
        
        // Verify that generation that was asked to be rendered actually exists
        var generation = generation
        if generation > system.n {
            generation = system.n
        }
        
        // Change the line length
        system.currentLength = Float( Double(system.initialLength) / pow(Double(system.reduction), Double(generation)) )
        
        // Render the word
        self.saveState()
        self.translate(byX: system.x, byY: system.y) // Move turtle to starting point
        for c in system.word[generation].characters {
            interpret(character: c, forThis: system)
        }
        self.restoreState()
        
    }
    
    public func renderAnimated(systems : [VisualizedLindenmayerSystem], generations : [Int]) {
        var i = 0
        for system in systems {
            // Verify that generation that was asked to be rendered actually exists
            var generation = generations[i]
            if generation > system.n {
                generation = system.n
            }
            
            // Things to do at start of L-system animation...
            if system.animationPosition == 0 {
                
                // Change the line length
                system.currentLength = Float( Double(system.initialLength) / pow(Double(system.reduction), Double(generation)) )
                
                // Move turtle to starting point
                //self.translate(byX: system.x, byY: system.y) // Move turtle to starting point
            }
            
            // Don't run past end of the word
            if system.animationPosition < system.word[generation].characters.count {
                
                // Get the index of the next character
                let index = system.word[generation].index(system.word[generation].startIndex, offsetBy: system.animationPosition)
                
                // Get the next character
                let c = system.word[generation][index]
                
                // Render the character
                interpret(character: c, forThis: system)
                
                // Move to next character in word
                system.animationPosition += 1
                
            }
            i += 1
        }
    }
    
    func interpret(character : Character, forThis system : VisualizedLindenmayerSystem) {
        // Interpret each character of the word
        let newX = Float(CGFloat(system.x)+cos(CGFloat(M_PI)*system.currentAngle/180)*CGFloat(system.currentLength))
        let newY = Float(CGFloat(system.y)+sin(CGFloat(M_PI)*system.currentAngle/180)*CGFloat(system.currentLength))
        // MARK: Switch
        switch character {
        case "F":
            // Go forward while drawing a line
            self.drawLine(fromX: system.x, fromY: system.y, toX: newX, toY: newY)
            system.x = newX
            system.y = newY
        case "f":
            // Go forward without drawing a line
            system.x = newX
            system.y = newY
        case "+":
            // Turn left
            system.currentAngle += system.angle
        case "-":
            // Turn right
            system.currentAngle -= system.angle
        case "1":
            self.lineColor = Color(hue: (system.colours["1"]?.hue)!, saturation: (system.colours["1"]?.saturation)!, brightness: (system.colours["1"]?.brightness)!, alpha: 100)
        case "2":
                self.lineColor = Color(hue: (system.colours["2"]?.hue)!, saturation: (system.colours["2"]?.saturation)!, brightness: (system.colours["2"]?.brightness)!, alpha: 100)
        case "3":
                self.lineColor = Color(hue: (system.colours["3"]?.hue)!, saturation: (system.colours["3"]?.saturation)!, brightness: (system.colours["3"]?.brightness)!, alpha: 100)
        default:
            break
        }
    }
}
