
//https://docs.swift.org/swift-book/documentation/the-swift-programming-language/stringsandcharacters/#String-Mutability

// String literal 
let someStirng = "Some stirng literal value"


// Multiline String Literal


let quotation = """
    The white rabbit put on his spectacles.
    " Where shall i begin, please your majesty \ 
    yes and other things "
 """


 // multi line string literal that ends with a line feed 

 let lineBreaks = """

 This string starts with a line break. 
 It also ends with a line break.

 """

 // Special characters in String literals 

//  String literals can include the following special characters:

// The escaped special characters \0 (null character), \\ (backslash), \t (horizontal tab), \n (line feed), \r (carriage return), \" (double quotation mark) and \' (single quotation mark)

//An arbitrary Unicode scalar value, written as \u{n}, where n is a 1–8 digit hexadecimal number 

// template literals can contain special characters and also arbitrary unicode scalar value as \u{n} where n is a 1-8 hexadecimal number 

let wisewords = "\"Imagination is more important than knowledge\" - Einstein"

let dollarSign = "\u{24}"

let blackHeart = "\u{2665}"

let sparklingHeart = "\u{1F496}"

//initializing an empty string 

var emptyString = ""

var anotherEmptyStirng = String()


// check whether a string is empty 


if emptyString.isEmpty {
    print("Nothing to see here")
}


// String mutability 

var variableString = "Horse"

variableString += " and carriage "

// error - the stirng here is declared with let therefore it is not mutable 

let constantString = "Highlander"

// constantString += "and another Highlander"


// Swift’s String type is a value type. If you create a new String value, that String value is copied when it’s passed to a function or method, or when it’s assigned to a constant or variable. In each case, a new copy of the existing String value is created, and the new copy is passed or assigned, not the original version. 

for character in "Dog!🐶" {
    print(character)
}

let exclamationMark:Character = "!"

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]

let catString = String(catCharacters)

print(catString)

// concatenating strings and characters 


let string1 = "hello"

let string2 = "   there"

var welcome = string1 + string2

var instruction = "look over"


// appending strings to string 

instruction += string2

//appending a character value to a string with the string types append method 

//You can’t append a String or Character to an existing Character variable, because a Character value must contain a single character only.

welcome.append(exclamationMark)

//String interpolation 

let multiplier = 3 
let message = "\(multiplier) times 2.5 is \(Double(multiplier)) * 2.5"

// You can use extended string delimiters to create strings containing characters that would otherwise be treated as a string interpolation


print(#"Write an interpolated string in Swift using \(multiplier)"#)


//unicode
// Unicode is an international standard for encoding, representing, and processing text in different writing systems. It enables you to represent almost any character from any language in a standardized form, and to read and write those characters to and from an external source such as a text file or web page.
//Behind the scenes, Swift’s native String type is built from Unicode scalar values. A Unicode scalar value is a unique 21-bit number for a character or modifier, such as U+0061 for LATIN SMALL LETTER A ("a"), or U+1F425 for FRONT-FACING BABY CHICK ("🐥").

// Every instance of Swift’s Character type represents a single extended grapheme cluster. An extended grapheme cluster is a sequence of one or more Unicode scalars that (when combined) produce a single human-readable character.

// Here’s an example. The letter é can be represented as the single Unicode scalar é (LATIN SMALL LETTER E WITH ACUTE, or U+00E9). However, the same letter can also be represented as a pair of scalars — a standard letter e (LATIN SMALL LETTER E, or U+0065), followed by the COMBINING ACUTE ACCENT scalar (U+0301). The COMBINING ACUTE ACCENT scalar is graphically applied to the scalar that precedes it, turning an e into an é when it’s rendered by a Unicode-aware text-rendering system.

// In both cases, the letter é is represented as a single Swift Character value that represents an extended grapheme cluster. In the first case, the cluster contains a single scalar; in the second case, it’s a cluster of two scalars:



let eAcute :Character = "\u{E9}"
let combinedEAcute:Character = "\u{65}\u{301}"

print(eAcute,combinedEAcute)

// Extended grapheme clusters are a flexible way to represent many complex single script achracters as a single Chracter value 
// For example, Hangul syllables from the Korean alphabet can be represented as either a precomposed or decomposed sequence. Both of these representations qualify as a single Character value in Swift:

let precomposed : Character = "\u{D55C}"

let decomposed : Character = "\u{1112}\u{1161}\u{11AB}"

print(precomposed,decomposed)

// Extended grapheme clusters enable scalars for enclosing marks (such as COMBINING ENCLOSING CIRCLE, or U+20DD) to enclose other Unicode scalars as part of a single Character value:

let enclosedEAcute:Character = "\u{E9}\u{20DD}"

//Unicode scalara for regional indicator symbols can be combiend in pairs to amke a single character value 

let regionalIndicatorForUS = "\u{1F1FA}\u{F1F8}"

print(regionalIndicatorForUS)

// Counting Charcters 
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"

print("unusualMenagerie has \(unusualMenagerie.count) characters")

// Note that Swift’s use of extended grapheme clusters for Character values means that string concatenation and modification may not always affect a string’s character count.

// For example, if you initialize a new string with the four-character word cafe, and then append a COMBINING ACUTE ACCENT (U+0301) to the end of the string, the resulting string will still have a character count of 4, with a fourth character of é, not e:


var word = "cafe"

print("the number of characters in \(word) is \(word.count)")

word += "\u{301}"

print("the number of characters in \(word) is \(word.count)")

//Accessing and modifying a string 


//different characters can require different amounts of memory to store, so in order to determine which Character is at a particular position, you must iterate over each Unicode scalar from the start or end of that String. For this reason, Swift strings can’t be indexed by integer values.

// each srtng value has an associated index type , String.Index which corresponds to the position of each string 

//You access the indices before and after a given index using the index(before:) and index(after:) methods of String. To access an index farther away from the given index, you can use the index(_:offsetBy:) method instead of calling one of these methods multiple times.

let greeting = "Guten Tag! "

print(greeting[greeting.startIndex])

print(greeting[greeting.index(before: greeting.endIndex)])

print(greeting[greeting.index(after: greeting.startIndex)])

let index = greeting.index(greeting.startIndex, offsetBy: 7)

print(greeting[index])


// attemting to access an index outside of a strings range or a character outside of a string's rnage will trigger a runtime error 

// greeting[greeting.endIndex]

// greeting.index(after:greeting.endIndex)


for index in greeting.indices {
    print("\(greeting[index])", terminator: "")
}

//You can use the startIndex and endIndex properties and the index(before:), index(after:), and index(_:offsetBy:) methods on any type that conforms to the Collection protocol. This includes String, as shown here, as well as collection types such as Array, Dictionary, and Set.


//inserting and removing 

var welcome1 = "hello"

welcome1.insert("!",at:welcome1.endIndex)


welcome1.insert(contentsOf: " there", at: welcome1.index(before:welcome1.endIndex))

print(welcome1)

// to remove a specified character from a string at a specified index, use the remove(at:) method, and to remove a substring at a specified range, use the remove Subrange(_:) method 

welcome1.remove(at: welcome1.index(before:welcome1.endIndex))

let range: Range<String.Index> = welcome1.index(welcome1.startIndex, offsetBy: 6)..<welcome1.endIndex

welcome1.removeSubrange(range)

print(welcome1)
// welcome1.removeSubrange(range)

// welcome should now equal "hello" 

// You can use the insert(_:at:), insert(contentsOf:at:), remove(at:), and removeSubrange(_:) methods on any type that conforms to the RangeReplaceableCollection protocol. This includes String, as shown here, as well as collection types such as Array, Dictionary, and Set.


//Substring
//When you get a substring from a string — for example, using a subscript or a method like prefix(_:) — the result is an instance of Substring, not another string.

//However, unlike strings, you use substrings for only a short amount of time while performing actions on a string. When you’re ready to store the result for a longer time, you convert the substring to an instance of String. 


let greeting1 = "Hello, world"

let index1 = greeting1.firstIndex(of: ",") ?? greeting1.endIndex

let beginning = greeting1[..<index1]


let newString = String(beginning)

print(newString)

//comparing Strings 

// String and character equality 

//Two String values (or two Character values) are considered equal if their extended grapheme clusters are canonically equivalent. Extended grapheme clusters are canonically equivalent if they have the same linguistic meaning and appearance, even if they’re composed from different Unicode scalars behind the scenes.

let quotation1 = "we're are a lot alike, you and I"

let sameQuotation = "We're a lot alike, you and I"

if quotation1 == sameQuotation {
    print("These two strings are considered equal")
}

// For example, LATIN SMALL LETTER E WITH ACUTE (U+00E9) is canonically equivalent to LATIN SMALL LETTER E (U+0065) followed by COMBINING ACUTE ACCENT (U+0301). Both of these extended grapheme clusters are valid ways to represent the character é, and so they’re considered to be canonically equivalent:


let eAcuteQuestion = "Voulez-vous un caf \u{E9}"

let combinedEAcuteQuestion = "Voulez-vous un caf \u{65}\u{301}"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}


// Conversely, LATIN CAPITAL LETTER A (U+0041, or "A"), as used in English, is not equivalent to CYRILLIC CAPITAL LETTER A (U+0410, or "А"), as used in Russian. The characters are visually similar, but don’t have the same linguistic meaning:


let latinCapitalLetterA : Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"


if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters aren't equivalent.")
}


// String and character comparisons in Swift aren’t locale-sensitive.

// Prefix and Suffix Equality

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]


var act1SceneCount = 0 

for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1 
    }
}

print("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0 

var ceilCount = 0 

for scene in romeoAndJuliet {
    if scene.hasSuffix("capulet's mansion") {
        mansionCount += 1 
    } else if scene.hasSuffix("Fryer lowsrence") {
        ceilCount += 1 
    }
}

print("\(mansionCount) mansion scenes; \(ceilCount) cell scenes")



// Unicode representation of strings 

// When a Unicode string is written to a text file or some other storage, the Unicode scalars in that string are encoded in one of several Unicode-defined encoding forms. Each form encodes the string in small chunks known as code units. These include the UTF-8 encoding form (which encodes a string as 8-bit code units), the UTF-16 encoding form (which encodes a string as 16-bit code units), and the UTF-32 encoding form (which encodes a string as 32-bit code units).

// A collection of UTF-8 code units (accessed with the string’s utf8 property)

// A collection of UTF-16 code units (accessed with the string’s utf16 property)


// You can access a UTF-8 representation of a String by iterating over its utf8 property. This property is of type String.UTF8View, which is a collection of unsigned 8-bit (UInt8) values, one for each byte in the string’s UTF-8 representation

let dogString = "Dog‼🐶" 



for codeUnit in dogString.utf8 {
    print("\(codeUnit)  ",terminator: "")
}
for codeUnit in dogString.utf16 {
    print("\(codeUnit)  ",terminator: "")
}

print("")

for scalar in dogString.unicodeScalars {
    print("\(scalar)")
}

print("")