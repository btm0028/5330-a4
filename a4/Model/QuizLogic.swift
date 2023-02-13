//
//  QuizLogic.swift
//  a4
//
//  Created by Brandon  Miller on 2/12/23.
//

import Foundation

struct QuizLogic {
    var questionIndex : Int = 0
    var score : Int = 0
    
    
    // Algo:
    //         0
    //         1
    //       2   3
    //       45  67
    //
    // Required score: 3
    
    let question = [
        Question("Memorize these facts to evade suspicion! Your undercover story is that you are simply an oil company executive meeting for business: you're discussing a plan to use U.S. government subsidies for new oil rigs in Minnesota. You're a resident of the UK. After meeting in Moscow, you'll fly to the U.S. to view the land. To start, please pick an undercover name:", "Dimitri Resnov", "Patricia Miles", "NO CORRECT ANSWER"),
        Question("The Russian authorities stop you and ask if you are here for business or for pleasure.", "Business", "Pleasure", "Business"),
        Question("The Russian officer nods in approval. \"That checks out,\" he says, \"you are heading to St. Petersburg, yes?\"", "Yes", "No", "No"),
        Question("\"Interesting,\" the officer says, \"your records show that you are here on oil business. Did your plans change?\"", "Yes", "No", "Yes"),
        Question("\"You're right,\" he says, \"My mistake. Moscow. Are you planning on applying for Russian subsidies?", "Yes", "No", "No"),
        Question("\"Strange,\" he says, \"As I look closer, it appears your boarding pass indicates you are heading to Moscow. Why would you reroute yourself so far away from your original destination?", "St. Petersberg is best!", "I misspoke originally", "I misspoke originally"),
        Question("\"Fair enough\" he says, \"How will you be enjoying yourself while visiting our country?", "I'll be visiting the St. Petersberg cathedral", "I want to see St. Basil's Cathedral", "I want to see St. Basil's Cathedral"),
        Question("\"You are making me quite uncomfortable\" he says, \"How do I know you are not here on suspicious foreign business?", "You can check my credentials, I am legit", "I am just a bit nervous, I do not travel much", "I am just a bit nervous, I do not travel much"),
        Question("Congrats, you won! Click either of the options below to start over.", "Thanks!", "OK", "No correct answer."),
        Question("Unfortunately, the authorities did not like your answers and you were arrested. Click either of the options below to start from the beginning.", "OK", "Restart", "No correct answer")
    ]
    
    mutating func compareUserAnswer(_ response: String) -> Bool {
        if response == question[questionIndex].answer {
            score += 1
            return true
        }
        else {
            return false
        }
    }
    
    mutating func increaseIndex() {
        if questionIndex < question.count - 1 {
            if (questionIndex == 1 && score == 1) {
                questionIndex += 1
            }
            else if (questionIndex == 1 && score == 0) {
                questionIndex += 2
            }
            else if (questionIndex == 2 && score == 2) {
                questionIndex += 2
            }
            else if (questionIndex == 2 && score == 1) {
                questionIndex += 3
            }
            else if (questionIndex == 3 && score == 1) {
                questionIndex += 3
            }
            else if (questionIndex == 3 && score == 0) {
                questionIndex += 4
            }
            else if (questionIndex == 4 || questionIndex == 5 || questionIndex == 6 || questionIndex == 7) {
                if (score == 3) {
                    questionIndex = 8
                }
                else {
                    questionIndex = 9
                }
            }
            else if (questionIndex == 9 || questionIndex == 8) {
                questionIndex = 0
                score = 0
            }
            else {
                questionIndex += 1
            }
        }
        else {
            questionIndex = 0
            score = 0
        }
    }
    
    func getNextQuestion() -> String {
        return question[questionIndex].question
    }
    
    func getChoiceOne() -> String {
        return question[questionIndex].option_one
    }
    
    func getChoiceTwo() -> String {
        return question[questionIndex].option_two
    }

    
    
}
