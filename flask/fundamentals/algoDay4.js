/* 
String: Is Palindrome
Create a function that returns a boolean whether the string is a strict palindrome. 
- palindrome = string that is same forwards and backwards

Do not ignore spaces, punctuation and capitalization
*/

const str1 = "a x a";
const expected1 = true;

const str2 = "racecar";
const expected2 = true;

const str3 = "Dud";
const expected3 = false;

const str4 = "oho!";
const expected4 = false;

/**
 * Determines if the given str is a palindrome (same forwards and backwards).
 * - Time: O(?).
 * - Space: O(?).
 * @param {string} str
 * @returns {boolean} Whether the given str is a palindrome or not.
 * 
 * 
 */
 function isPalindrome(str) {
    var newString = "";
    for(var i = str.length - 1; i >= 0; i--) {
        newString += str[i];
    }
    console.log(newString);
    if(str == newString) {
        console.log("This is a palindrome");
        return true;
    }
    else {
        console.log("This is not a palindrome");
        return false;
    }
}

isPalindrome(str1);
isPalindrome(str2);
isPalindrome(str3);
isPalindrome(str4);


function isPalindrome2(str) {
    if (str === "") {
        return false;
    }   
    for (var i=0; i<str.length/2; i++) {
        if (str[i] != str[str.length-(i+1)]) {
            return false;
        }
    }
    return true;
}

console.log(isPalindrome2(str1));
console.log(isPalindrome2(str2));
console.log(isPalindrome2(str3));
console.log(isPalindrome2(str4));

/*****************************************************************************/

/* 
Longest Palindrome
For this challenge, we will look not only at the entire string provided,
but also at the substrings within it.
Return the longest palindromic substring. 
Strings longer or shorter than complete words are OK.
All the substrings of "abc" are:
a, ab, abc, b, bc, c
*/


const two_str1 = "what up, daddy-o?";
const two_expected1 = "dad";

const two_str2 = "uh, not much";
const two_expected2 = "u";

const two_str3 = "Yikes! my favorite racecar erupted!";
const two_expected3 = "e racecar e";

const two_str4 = "a1001x20002y5677765z";
const two_expected4 = "5677765";

const two_str5 = "a1001x20002y567765z";
const two_expected5 = "567765";

/**
 * Finds the longest palindromic substring in the given string.
 * - Time: O(?).
 * - Space: O(?).
 * @param {string} str
 * @returns {string} The longest palindromic substring from the given string.
 * 
 * 
 */
function isPalindrome3(str) {
    for (var i = 0; i < str.length / 2; i++) {
        if (str[i] !== str[str.length - i - 1]) {
            return false
        }
    }
    return true
}
function longestPalindromicSubstring(str) {
    var longPal = ''
    for (var i = 0; i < str.length; i++) {
        var temp = ''
        for (var j = i; j < str.length; j++) {
            temp += str[j]
            if (isPalindrome3(temp) === true) {
                if (temp.length > longPal.length) {
                    longPal = temp
                }
            }
        }
    }
    return longPal
}

console.log(isPalindrome2(two_str1));
console.log(isPalindrome2(two_str2));
console.log(isPalindrome2(two_str3));
console.log(isPalindrome2(two_str4));


function isPalindrome3(str) {
    let leftIndex = 0
    let rightIndex = str.length - 1

    while (leftIndex < rightIndex) {
    if (str[leftIndex] !== str[rightIndex]) {
        return false
    }

    leftIndex++
    rightIndex--
    }
    return true
}

function longestPalindromicSubstring1(str) {

    let currentLongest = str[0]
    
    for (let i = 0; i < str.length; i++) {
    for (let j = i + 1; j < str.length; j++) {
        let subStr = str.substring(i, j)
        if (isPalindrome(subStr) && subStr.length > currentLongest.length) {
        currentLongest = str.substring(i, j)
        }
    }
    }
    
    return currentLongest
}