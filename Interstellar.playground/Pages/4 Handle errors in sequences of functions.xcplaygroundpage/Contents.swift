//: [Previous](@previous)

//: Handle errors in sequences of functions

import Foundation
import Interstellar

let text = Signal<String>()
func greetMaybe(subject: String)->Result<String> {
    if subject.characters.count % 2 == 0 {
        return .success("Hello \(subject)")
    } else {
        let error = NSError(domain: "Don't feel like greeting you.", code: 401, userInfo: nil)
        return .Error(error)
    }
}
text
    .flatMap(greetMaybe)
    .next { text in
        print(text)
    }
    .error { error in
        print("There was a greeting error")
    }
text
    .update(.success("World"))

//: [Next](@next)
