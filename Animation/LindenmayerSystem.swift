import Foundation

public class LindenmayerSystem {
    // Set up required information
    var angle : Degrees                 // rotation amount for turtle (degrees)
    var axiom : String
    var rules : [Character : String]
    var n : Int                         // number of times the production rule is applied
    var word : [String] = [] // the word that will be rendered
    // is rendered with an animation, step by step
    var stochastic = false
    
    public init(angle : Degrees,
                axiom : String,
                rules : [Character : String],
                generations : Int) {
        
        // Initialize stored properties
        self.angle = angle
        self.axiom = axiom
        self.rules = rules
        self.n = generations
        self.word.append(axiom)   // The first word is the axiom
        
        // Apply the production rule
        applyRules()
        
    }
    
    public init(with system : LindenmayerSystem) {
        
        // Initalize stored properties
        self.angle = system.angle
        self.axiom = system.axiom
        self.rules = system.rules
        self.n = system.n
        self.word.append(axiom)   // The first word is the axiom
        
        for rule in rules {
            if rule.value[rule.value.index(rule.value.startIndex, offsetBy: 1)] == "/" {
                stochastic = true
            }
        }
        // Apply the production rule
        applyRules()
    }
    
    func applyRules() {
        // Create a new word
        var newWord = ""
        
        // See if word needs to be re-written
        if n > 0 {
            
            // Apply the production rule "n" times
            for i in 1...n {
                
                // Inspect each character of existing word
                for character in word[i - 1].characters {
                    
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
