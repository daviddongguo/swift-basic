import Foundation



class Personality {
    var lionLikelihood: Int = 0
    var owlLikelihood: Int = 0
    var dolphinLikelihood: Int = 0
    var butterflyLikelihood: Int = 0
    
    var like: AnimalEnum {
        var highestLikelihood = lionLikelihood
        var animal = AnimalEnum.lion
        
        if owlLikelihood > highestLikelihood {
            highestLikelihood = owlLikelihood
            animal = .owl
        }
        
        if dolphinLikelihood > highestLikelihood {
            highestLikelihood = dolphinLikelihood
            animal = .dolphin
        }
        
        if butterflyLikelihood > highestLikelihood {
            highestLikelihood = butterflyLikelihood
            animal = .butterfly
        }
        
        return animal
    }
    
    func addLikehood(_ animals: [AnimalEnum]) {
        
        for animal in animals {
            switch animal {
            case .lion:
                self.lionLikelihood += 10
            case .owl:
                self.owlLikelihood += 10
            case .dolphin:
                self.dolphinLikelihood += 10
            case .butterfly:
                self.butterflyLikelihood += 10
            }
        }
        
    }
    
}

class Answer {
    let personality: Personality
    let id: Int
    let text: String?
    init(personality: Personality, id: Int, text: String? = "") {
        self.personality = personality
        self.id = id
        self.text = text
    }
    func submit() -> Void {}
}


class AnswerTrueOfFalse: Answer {
    var animalLikehoods: [AnimalEnum] = []
    var selected: Bool = false
    override func submit() {
        if selected {
            self.personality.addLikehood(self.animalLikehoods)
        }
    }
    init(personality: Personality, id: Int, text: String? = "", animalLikehoods: [AnimalEnum], selected: Bool) {
        super.init(personality: personality, id: id, text: text)
        self.animalLikehoods = animalLikehoods
        self.selected = selected
    }
}

class AnswerSingleSelection: Answer {
    var selectedString: String = ""
    let lionString: String?
    let owlString: String?
    let dophinString: String?
    let butterflyString: String?
    
    init(personality: Personality, id: Int, text: String? = "", selectedString: String, lionString: String?, owlString: String?, dophinString: String?, butterflyString: String?) {
        self.selectedString = selectedString
        self.lionString = lionString
        self.owlString = owlString
        self.dophinString = dophinString
        self.butterflyString = butterflyString
        super.init(personality: personality, id: id, text: text)
    }
    
    override func submit() {
        switch selectedString {
        case selectedString:
            self.personality.addLikehood([.lion])
        case owlString:
            self.personality.addLikehood([.owl])
        case dophinString:
            self.personality.addLikehood([.dolphin])
        case butterflyString:
            self.personality.addLikehood([.butterfly])
        default:
            break
        }
        
        print("lion: \(personality.lionLikelihood)")
        print("owl: \(personality.owlLikelihood)")
        print("dolphin: \(personality.dolphinLikelihood)")
        print("butterfly: \(personality.butterflyLikelihood)")
        
    }
    
    
}

class AnswerNumberValue: Answer {
    var numberValue: Int = 0
    let lionRange: ClosedRange<Int>
    let owlRange: ClosedRange<Int>
    let dophinRange: ClosedRange<Int>
    let butterflyRange: ClosedRange<Int>
    
    init(personality: Personality, id: Int, text: String? = "", numberValue: Int, lionRange: ClosedRange<Int>, owlRange: ClosedRange<Int>, dophinRange: ClosedRange<Int>, butterflyRange: ClosedRange<Int>) {
        self.numberValue = numberValue
        self.lionRange = lionRange
        self.owlRange = owlRange
        self.dophinRange = dophinRange
        self.butterflyRange = butterflyRange
        super.init(personality: personality, id: id, text: text)
    }
    
    
    
    override func submit() {
        switch self.numberValue {
        case lionRange:
            self.personality.addLikehood([.lion])
        case owlRange:
            self.personality.addLikehood([.owl])
        case dophinRange:
            self.personality.addLikehood([.dolphin])
        case butterflyRange:
            self.personality.addLikehood([.butterfly])
        default:
            break
        }
        
        print("lion: \(personality.lionLikelihood)")
        print("owl: \(personality.owlLikelihood)")
        print("dolphin: \(personality.dolphinLikelihood)")
        print("butterfly: \(personality.butterflyLikelihood)")
        
    }
    
    
}


struct Quiz {
    let personality: Personality
    let question: String
    let answers: Array<Answer>
}


import Foundation

let personality: Personality = Personality()
let quiz1 = Quiz(personality: personality,
                 question: """
                    Imagine yourself in a forest.
                    As you walk forward,
                    you see a small cottage before you.
                    And you notice...
                 """,
                 answers: [
                    AnswerTrueOfFalse(personality: personality, id: 0, text: "A massive tree",  animalLikehoods: [.owl, .lion], selected: false),
                    AnswerTrueOfFalse(personality: personality, id: 1, text: "A vast meadow",  animalLikehoods: [.lion, .butterfly], selected: false),
                    AnswerTrueOfFalse(personality: personality, id: 2, text: "A myriad of colorful flowers",  animalLikehoods: [.butterfly, .dolphin], selected: false),
                    AnswerTrueOfFalse(personality: personality, id: 3, text: "The door is open",  animalLikehoods: [], selected: false),
                 ])
let quiz2 = Quiz(personality: personality,
                 question: """
                            You enter the cottage and notice a table in the center of the room.
                            The table's shape is a ?
                          """,
                 answers:  [
                    AnswerTrueOfFalse(personality: personality, id: 0, text: "Circle?",  animalLikehoods: [.owl], selected: false),
                    AnswerTrueOfFalse(personality: personality, id: 1, text: "Square?",  animalLikehoods: [.dolphin], selected: false),
                    AnswerTrueOfFalse(personality: personality, id: 2, text: "Rectangle",  animalLikehoods: [.lion], selected: false),
                    AnswerTrueOfFalse(personality: personality, id: 3, text: "triangle",  animalLikehoods: [.butterfly], selected: false),]     )

let quiz3 = Quiz(personality: personality,
                 question: """
                            You spot a vase filled with flowers.
                            The number of flowers is
                          """,
                 answers:  [AnswerNumberValue(personality: personality, id: 0, numberValue: 0, lionRange: 0...3, owlRange: 4...6, dophinRange: 7...9, butterflyRange: 10...12)]     )

let quiz4 = Quiz(personality: personality,
                 question: """
                            As you walk around to the back of it.
                            You discover a small river.
                            You dip your toes into the water.
                            The temperature of it is:
                          """,
                 answers:  [AnswerSingleSelection(personality: personality, id: 0, selectedString: "", lionString: TemperatureOfRiverEnum.colder.rawValue, owlString: TemperatureOfRiverEnum.cold.rawValue, dophinString: TemperatureOfRiverEnum.normal.rawValue, butterflyString: TemperatureOfRiverEnum.warmer.rawValue)]
)



//let quizs: [Quiz] = [quiz1, quiz2, quiz3, quiz4]
//
//let answer1: AnswerTrueOfFalse = quiz1.answers[1] as! AnswerTrueOfFalse
//let answer2: AnswerTrueOfFalse = quiz1.answers[2] as! AnswerTrueOfFalse
//let answer3: AnswerNumberValue = quiz3.answers[0] as! AnswerNumberValue
//answer1.selected = true
//answer1.submit()
//answer2.selected = true
//answer2.submit()
//answer3.numberValue = 95
//answer3.submit()
//
////print(quizs)
//for q in quizs {
//    for a in q.answers {
//        print("lion: \(a.personality.lionLikelihood)")
//        print("owl: \(a.personality.owlLikelihood)")
//        print("dolphin: \(a.personality.dolphinLikelihood)")
//        print("butterfly: \(a.personality.butterflyLikelihood)")
//    }
//}






