
/*****************************************************************************/

/* 
Acronyms
Create a function that, given a string, returns the string’s acronym 
(first letter of each word capitalized). 
Do it with .split first if you need to, then try to do it without
*/

const two_str1 = "object oriented programming";
const two_expected1 = "OOP";

// The 4 pillars of OOP
const two_str2 = "abstraction polymorphism inheritance encapsulation";
const two_expected2 = "APIE";

const two_str3 = "software development life cycle";
const two_expected3 = "SDLC";

// Bonus: ignore extra spaces
const two_str4 = "  global   information tracker    ";
const two_expected4 = "GIT";

/**
 * Turns the given str into an acronym.
 * - Time: O(?).
 * - Space: O(?).
 * @param {string} wordsStr A string to be turned into an acronym.
 * @returns {string} The acronym.
 * 
 * 
 */

function reverseStr(str) {
    var temp = "";
    for (var i = str.length - 1; i >= 0; i--) {
        temp += str[i];
    }
    return temp;
}

function split(str1) {
	/*
    x- split argument into string array 
    x- for loop for each value in array
        x- get first letter of each string
        x- add each char into newStr
        x- capitalize all of newStr .uppercase()
    BONUS CASE with .join()
        x- remove emptyarray items
    */

	var breakdownArray = str1.split(" ");
	var newStr = "";
	for (var i = 0; i < breakdownArray.length; i++) {
		if (breakdownArray[i] != "") {
			newStr += breakdownArray[i][0];
		}
	}
	newStr = newStr.toUpperCase();
	return newStr;
}

console.log(split(two_str1));
console.log(split(two_str2));
console.log(split(two_str3));
console.log(split(two_str4));

function noSplit(str) {
    var newVal = "";
    for (var i = 0; i < str.length - 1; i++) {
        if (i == 0 && str[i] != " ") {
            newVal += str[i];
        } else if (str[i] == " ") {
            if (str[i + 1] != " ") {
                newVal += str[i + 1];
            }
        }
    }
    return newVal;
}

console.log(noSplit(two_str1));
console.log(noSplit(two_str2));
console.log(noSplit(two_str3));
console.log(noSplit(two_str4));