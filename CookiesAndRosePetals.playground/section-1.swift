// Thinkful Playground
// Thinkful.com

// Cookies and Rose Petals

// This example covers basic object oriented programming in Swift.

// My Grandma has a cookie container... and nothing bad happens when I put two different types of cookies in it at the same time. And surely enough, I can even throw some rose petals in there too. Again, nothing bad happens... and the same can be true in Swift. We can create a container (an array) that can contain any object. But when you grab an object out of the cookie container, you need to check what type of object it is before you eat it ;) In Swift this involves downcasting. You surely don't want to eat rose petals...

import UIKit

class Cookie {
    
    var description: String
    
    init(description: String) {
        self.description = description
    }
}

class Snickerdoodle : Cookie {
    
    init() {
        super.init(description: "I'm a type of cookie made with butter or oil, sugar, and flour rolled in cinnamon sugar.")
    }
}

class OatmealRaisinCookie : Cookie {
    
    init() {
        super.init(description: "Oatmeal and raisins may sound healthy... but I'm still a cookie.")
    }
}

class RosePetal {
    let poem = "Roses are red and violets are blue. Syntax sugar is a joy to use. [AnyObject] is the same as Array<AnyObject> and [Int] is the same as Array<Int> and so on.\n"
    var color: UIColor
    
    init(color: UIColor) {
        self.color = color
    }
}

var cookieContainer: [AnyObject] = [] // Preferred way to write it
//var cookieContainer = [AnyObject]() // This works too, but not my favorite. Technnically it is shorter than the previous way, so feel free to do it this way if you want.
//var cookieContainer = Array<AnyObject>() // This works too, but it's unnecessarily long.
//var cookieContainer: Array<AnyObject> = [] //This works too, but it's also unnecessarily long.

let snickerdoodle = Snickerdoodle()
cookieContainer.append(snickerdoodle)

let oatmealRaisinCookie = OatmealRaisinCookie()
cookieContainer.append(oatmealRaisinCookie)

let prettyMuchMagenta = UIColor(red: 0.7, green: 0.05, blue: 0.4, alpha: 1.0)
let rosePetalOne = RosePetal(color: prettyMuchMagenta)
cookieContainer.append(rosePetalOne)

let pinkishColor = UIColor(red: 0.9, green: 0.3, blue: 0.5, alpha: 1.0)
let rosePetalTwo = RosePetal(color: pinkishColor)
cookieContainer.append(rosePetalTwo)

let numberOfItemsInMyArray = cookieContainer.count
let myArrayCapacity = cookieContainer.capacity

// What's the capacity look like if we add a few more things?

cookieContainer.append("some text.")
cookieContainer.append("different text.")

cookieContainer.count
cookieContainer.capacity // Capacity grows.

// Let's take a look at what's inside...

for i in 0..<cookieContainer.count {
    
    let item: AnyObject = cookieContainer[i] // The item could be anything
    
    if let item = item as? String {
        // If it's a String, let's print that to the console.
        println("Item number " + String(i) + " says " + item)
    }
    
    if let item = item as? Cookie {
        // If it's a Cookie then we know that it has a description property, so lets print that to the console. At this point we know it is safe to eat ;)
        println("Item number " + String(i) + " says " + item.description)
        if item as? Snickerdoodle != nil {
            // If it reaches this point then it's a Snickerdoodle.
            println("And we can tell it was a Snickerdoodle.\n")
        }
        if item as? OatmealRaisinCookie != nil {
            // If it reaches this point then it's an OatmealRaisinCookie.
            println("And we can tell it was an oatmeal raisin cookie.\n")
        }
    }
    
    if let item = item as? RosePetal {
        // Better not eat this one ;)
        println("Item " + String(i) + " is a rose petal.")
    }
}

// We could also contain a "Cookies Only" container which is only allowed to contain cookies :)

var cookiesOnlyContainer: [Cookie] = []

cookiesOnlyContainer.append(snickerdoodle) // That works.
cookiesOnlyContainer.append(oatmealRaisinCookie) // That works too.

//cookiesOnlyContainer.append(rosePetalOne) // This exclusive container doesn't accept rose petals. It's very close minded ;)
