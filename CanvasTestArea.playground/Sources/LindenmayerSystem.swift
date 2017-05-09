import Foundation

public class LindenmayerSystem {
    // Set up required information
    var initialLength : Int             // initial line segment length
    var currentLength : Int             // current line segment length
    var reduction : Int                 // reduction factor
    var x : Int                         // initial horizontal position of turtle
    var y : Int                         // initial vertical position of turtle
    var direction : Int                 // initial direction turtle faces (degrees)
    var angle : Degrees                 // rotation amount for turtle (degrees)
    var axiom : String
    var rules : [Character : String]
    var n : Int                         // number of times the production rule is applied
    var word : String                   // the word that will be rendered
    
    public init(length : Int, reduction : Int, x : Int, y : Int, direction : Int, angle : Degrees, axiom : String, rule : String, generations : Int, rules : [Character : String]) {
        
        // Initialize stored properties
        initialLength = length
        currentLength = initialLength
        self.reduction = reduction
        self.x = x
        self.y = y
        self.direction = direction
        self.angle = angle
        self.axiom = axiom
        self.rules = rules
        self.n = generations
        self.word = axiom   // Word begins as the axiom
        
        // Apply the production rule
        applyRules()
        
    }
    
    func applyRules() {
        // Create a new word
        var newWord = ""
        
        // See if word needs to be re-written
        if n > 0 {
            
            // Apply the production rule "n" times
            for _ in 1...n {
                
                // Inspect each character of existing word
                for character in word.characters {
                    
                    for (key, rule) in rules {
                        if character == key {
                            
                            // apply production rule, replace "old" F with new string
                            newWord.append(rule)
                            
                        }
                    }
                    if character == "+" || character == "-" {
                        // just copy what's in the existing word to the new word
                        newWord.append(character)
                    }
                    
                }
            }
            
            // Replace the existing word with the new word
            word.append(newWord)
            
        }
        
    }
    
}

