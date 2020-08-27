//
//  ViewController.swift
//  Quizzler-iOS13
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var barProgress: UIProgressView!
    @IBOutlet weak var buttonTrue: UIButton!
    @IBOutlet weak var buttonFalse: UIButton!
    
    var questions = ["A slug's body is green", "Approximately one quarter of human bones are in the feet.", "The total surface area of two human lungs is approximately 70 square metres.",  "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", "It is illegal to pee in the Ocean in Portugal.", "You can lead a cow down stairs but not up stairs.", "Google was originally called 'Backrub'.", "Buzz Aldrin's mother's maiden name was 'Moon'.", "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", "No piece of square dry paper can be folded in half more than 7 times.", "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog."];
    
      var questionNumber = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barProgress.progress = 0.0;
        questionLabel.text = questions[questionNumber];
    }
    @IBAction func keyPressed(_ sender: UIButton) {
        if(sender.currentTitle == "True" && ((questionNumber == 0) || (questionNumber == 1) || (questionNumber == 2) || (questionNumber == 3) || (questionNumber == 5) || (questionNumber == 7) || (questionNumber == 8) || (questionNumber == 11)))
        {
            barProgress.progress = barProgress.progress + (1/12);
           
            sender.backgroundColor = UIColor.green;
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
                sender.backgroundColor = UIColor.clear;
            }
            
        }
        if(sender.currentTitle == "False" && ((questionNumber == 0) || (questionNumber == 1) || (questionNumber == 2) || (questionNumber == 3) || (questionNumber == 5) || (questionNumber == 7) || (questionNumber == 8) || (questionNumber == 11)))
        {
            sender.backgroundColor = UIColor.red;
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
                sender.backgroundColor = UIColor.clear;
            }
            
        }
        if(sender.currentTitle == "False" && ((questionNumber == 4) || (questionNumber == 6) || (questionNumber == 9) || (questionNumber == 10)))
        {
            barProgress.progress = barProgress.progress + (1/12);
           
            sender.backgroundColor = UIColor.green;
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
            sender.backgroundColor = UIColor.clear;
            }
        }
        if(sender.currentTitle == "True" && ((questionNumber == 4) || (questionNumber == 6) || (questionNumber == 9) || (questionNumber == 10)))
        {
            sender.backgroundColor = UIColor.red;
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
            sender.backgroundColor = UIColor.clear;
            }
        }
        questionNumber += 1;
        if (questionNumber < 12){
        questionLabel.text = questions[questionNumber];
        }
        else
        {
            questionLabel.textColor = UIColor.brown; //this is how we assign color to text
            questionLabel.text = "Game Over! Your score is \((barProgress.progress)*100) %!";
        }
        
    }
    
    /*
     Solution  Angela's: -
     @IBOutlet weak var questionLabel: UILabel!
        @IBOutlet weak var barProgress: UIProgressView!
        @IBOutlet weak var buttonTrue: UIButton!
        @IBOutlet weak var buttonFalse: UIButton!
        
        var questionNumber = 0;
        var questions = [   //using 2d array
        ["Paris is the capital of France", "True"],
        ["5 multiply 5 is 20", "True"],
        ["94 - 4 is 90", "False"]
        ];
         override func viewDidLoad() {
            super.viewDidLoad()
            questionLabel.text = questions[questionNumber][0]; //accessing 2d array
        }
      @IBAction func keyPressed(_ sender: UIButton) {
             let userAnswer = sender.currentTitle;
             let actualAnswer = quiz[questionNumber][1];
             
             if userAnswer == actualAnswer {
                 print("Right");
             }
             else{
                 print("Wrong");
             }
             if(questionNumber <= questions.count)
             {questionNumber += 1;
             }
             questionLabel.text = questions[questionNumber][0];
         }
     (all of this is just from first video, will be changed to accomodate struct!)
     _________________________________________________
     CREATE A NEW SEPARATE FILE FOR OUR STRUCT....USE FILE->NEW->SAVE AS QUESTION.SWIFT
     //INSIDE THE FILE
     import Foundation //already in file
     
     struct Questions {
         let text: String
         let answer: String
     }
     
     init(text: String, answer: String)
     {
         self.text = text;
         self.answer = answer;
     }
     //STRUCT FILE CLOSED
     ____________________________________________________
     @IBOutlet weak var questionLabel: UILabel!
            @IBOutlet weak var barProgress: UIProgressView!
            @IBOutlet weak var buttonTrue: UIButton!
            @IBOutlet weak var buttonFalse: UIButton!
            
           var questionNumber = 0;
           let questions = [    //we have an array of Question() objects now rather than a 2d array
            Questions(text: "Paris is the capital of France", answer: "True"),
            Questions(text: "5 multiply 5 is 20", answer: "True"),
            Questions(text: "94 - 4 is 90", answer: "False")
            ];
             override func viewDidLoad() {
                super.viewDidLoad()
                questionLabel.text = questions[questionNumber].text;
            }
          @IBAction func keyPressed(_ sender: UIButton) {
                 let userAnswer = sender.currentTitle;
                 let actualAnswer = quiz[questionNumber].answer; //accessing the answer property from a specific indexed object in array
                 
                 if userAnswer == actualAnswer {
                     sender.backgroundColor = UIColor.green;
                 }
                 else{
                     sender.backgroundColor = UIColor.red;
                 }
                 if(questionNumber <= questions.count)
                 {questionNumber += 1;
                 }
                 questionLabel.text = questions[questionNumber].text;
             }
     
     (NOT ALL DETAILS ARE ADDDED.. I JUST ADDED IT TO SHOW HOW TO USE 2D ARRAYS AND STRUCTS)
     ____________________________________
     */

    /*
     Struct Lesson: - (A class with public fields)
     It is a user-defined data type that can store multiple related items. A struct variable is similar to a database record since it may contain multiple data types related to a single entity.
     __________________________________________________
     defining = struct Town{
        //These            let name = "Angelaland"
        //3 lines          var citizens = ["Angela", "Jack"] //array
        //are properties   var resources = ["Grain" : 100 , "Ore" : 42] //dictionary
     
                 func fortify()    // a method (functions inside a class or a struct are called methods)
                 {
                   print("Defences increased!")
                  }
     using =
        var myTown = Town()  //creating an object, just like with classes
        print(myTown.citizens)
        print("\(myTown.name) has \(myTown.resources["Grain"]!) bagas of grain.")
        myTown.citizens.append("Taha")  //use .append to add
        print(myTown.citizens.count)   //use .count for new count
        myTown.fortify();  //calling the method
     ___________________________________________________
     defining = struct Town{
        //These            let name:String
        //3 lines          var citizens: [String]
        //are properties   var resources: [String:Int]
        //and we are not assigning them anby values this time
      
                 init(townName: String, people: [String],stats: [String:Int]{  //just like constructor in classes
                 name = townName;                                          //init() used to initialize properties
                 citizens = people;
                 resources = stats;
                 }
                 func fortify()
                 {
                   print("Defences increased!")
                  }
     using=
     var anotherTown = Town(townName: "Taha Island", people: ["Tom"], stats: ["Coconuts" : 100]) //creating an object and them fillinhg in paramters as asked through init() method
     anotherTown.citizens.append("Aqsa");
     ____________________________________________________
     defining = struct Town{
        //These            let name:String
        //3 lines          var citizens: [String]
        //are properties   var resources: [String:Int]
        //and we are not assigning them anby values this time
      
                 init(name: String, citizens: [String],resources: [String:Int]{
                 self.name = name;   //as we cant do name = name, we use "self"
                 self.citizens = citizens;  //self.name will refer to the main property/object
                 self.resources = resources;
                 }
                 func fortify()
                 {
                   print("Defences increased!")
                  }
     using=
     var anotherTown = Town(name: "Taha Island", citizens: ["Tom"], resources: ["Coconuts" : 100])
     var ghostTown = Town(name: "Ghost Island", citizens: [], resources: ["Mango" : 100])
     anotherTown.citizens.append("Aqsa");
     ghostTown.fortify();
     */
    /*
     Functions that return stuff: -
     declaring:
     func getMilk (money:Int) -> Int { //This arrow specifies what data type is to be returned
     let change = money -2;
     return change;
     }
     calling:
     var answer = getMilk(4);
     print(answer);
     */
    
    /*
     Mutating/Immutable Functions:
     
       Sometimes, when we deal with self.something, in init(), and then create a function that deals with something =100; we might get an error that self.something is immutable..in this case, change the signature of the function from just func methodSomething() to mutating func methodSomething().
     
     (for this to work, we need to make sure that the object we created later from the struct, while calling/making obejct.. we need to amke sure that the object is declared as "var" and not "let")
     */
}

