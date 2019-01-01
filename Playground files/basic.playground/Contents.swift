import UIKit

var monsterHealth = 19

let myFirstName : String = "Halex"

print("Hello, \(myFirstName)")

// functions

func heNeedSomeMilk(amount: Int, money: Int) -> Int {
    print("reach")
    print("buy \(amount) cartons of milk")
    let pay = amount * 3
    print("pay the guy \(pay)$")
    print("reach back")
    
    let change = money - pay
    return change
}

var change = heNeedSomeMilk(amount: 3, money: 10)

print("Guy, you have \(change)$ of change")

// if/else statement
func checkLove(yourName: String, theirName: String) -> String {
    let loveScore = arc4random_uniform(101)
    
    if loveScore > 80 {
        return "Your score is \(loveScore)%. LOVE is possible"
    }
    else if loveScore > 40 && loveScore <= 80 {
        return "Your score is \(loveScore)%. Love may be possible, but tread carefully"
    }

    else {
        return "Sorry, your score is \(loveScore)%. NO LOVE RIP"
    }
}

print(checkLove(yourName: "Me", theirName: "You"))

// BMI Calculator

func calcBMI(height: Float, mass: Float) -> String {
    let BMI = mass / (height * height)
    if BMI > 25 {
        return "your BMI is \(BMI) and you are overweight"
    }
    else if BMI > 18.5 && BMI <= 25 {
            return "your BMI is \(BMI) and you have normal bodyweight levels"
        }
    else {
        return "your BMI is \(BMI) and you are underweight"
    }
}

print(calcBMI(height: 1.9, mass: 62))

// Loops

let array = [1,3,5,7,2,9,8,0]

var sum = 0

for number in array {
   sum+=number
}

print(sum)

for number in 1...10 where number % 2 == 0{
    print(number)
}

func beerSong(amount: Int) -> String {
    var lyrics = ""
    for number in (1...amount).reversed() {
        let newLine = "\n\(number) bottles of beer on the wall, \(number) bottles of beer.\nTake one down and pass it around, \(number - 1) bottles of beer on the wall.\n"
        lyrics += newLine
    }
    
    lyrics += "\nNo more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, \(amount) bottles of beer on the wall.\n"
    return lyrics
}

print(beerSong(amount: 3))


func fibonnaci(until num : Int) -> String {
    var finalSequence = ""
    var fibonnacis = [0, 1]
    for number in 2..<num {
        fibonnacis.append((fibonnacis[number - 1] + fibonnacis[number - 2]))
    }
    for number in fibonnacis {
        finalSequence += "\(number),"
    }
    let finalSequenc = String(finalSequence.dropLast())
    return finalSequenc
}

print(fibonnaci(until: 8))








