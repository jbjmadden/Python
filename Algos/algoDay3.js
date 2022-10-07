/* 
Given in an alumni interview in 2021.
String Encode
You are given a string that may contain sequences of consecutive characters.
Create a function to shorten a string by including the character,
then the number of times it appears. 


If final result is not shorter (such as "bb" => "b2" ),
return the original string.
*/

const str1 = "aaaabbcdddaaa";
const expected1 = "a4b2c1d3a3";

const str2 = "";
const expected2 = "";

const str3 = "a";
const expected3 = "a";

const str4 = "bbcc";
const expected4 = "bbcc";

/**
 * Encodes the given string such that duplicate characters appear once followed
 * by a number representing how many times the char occurs. Only encode strings
 * when the result yields a shorter length.
 * - Time: O(?).
 * - Space: O(?).
 * @param {string} str The string to encode.
 * @returns {string} The given string encoded.
 * 
 * 
 */
 function encodeStr(str) {
    var newString = ""
    var count = 1;
    for (var i=0; i<str.length; i++) {
        newString+=str[i];
        count = 1;
        var j = i;
        while (str[j] === str[(j+1)]) {
            count++;
            j++;
        }
        i=(j);
        newString+=count;
    }
    if (newString.length >= str.length){
        return str;
    }
    else{
        return newString;
    }
}
console.log(encodeStr(str1))
console.log(encodeStr(str2))
console.log(encodeStr(str3))
console.log(encodeStr(str4))

function encodeStr2(str) {
    let currentLetter = str[0]
    let count = 0
    let encodedString = ""

    for (let i = 0; i < str.length; i++) {
    if (currentLetter === str[i]) {
        count++
    } else {
        encodedString += currentLetter + count
        currentLetter = str[i]
        count = 1
    }
    }
    encodedString += currentLetter + count
    return str.length <= encodedString.length ? str : encodedString

}
console.log(encodeStr2(str1))
console.log(encodeStr2(str2))
console.log(encodeStr2(str3))
console.log(encodeStr2(str4))

function encode(str) {
    let result = "";
    let i = 1;
    let letterCount = 1;
    let arr = str.split("");
    let tempLetter = arr[0];
    while (i <= arr.length) {
        if (tempLetter == arr[i]) {
            letterCount++;
            i++;
        } else {
            result += tempLetter + letterCount;
            tempLetter = arr[i];
            letterCount = 1;
            startNum = i;
            i++;
        }
    }
    if (result.length >= str.length) {
        result = str;
    }
    return result;
}
console.log(encode(str1))
console.log(encode(str2))
console.log(encode(str3))
console.log(encode(str4))
/*****************************************************************************/

/*
String Decode
*/

const two_str1 = "a3b2c1d3";
const two_expected1 = "aaabbcddd";

const two_str2 = "a3b2c12d10";
const two_expected2 = "aaabbccccccccccccdddddddddd";

/**
 * Decodes the given string by duplicating each character by the following int
 * amount if there is an int after the character.
 * - Time: O(?).
 * - Space: O(?).
 * @param {string} str An encoded string with characters that may have an int
 *    after indicating how many times the character occurs.
 * @returns {string} The given str decoded / expanded.
 * 
 * 
 */

function decodeStr(str = "") {
    let decoded = "";
    let i = 0;

    while (i < str.length) {
      // Retrieve letter at current index then increment the idx (post increment)
      // to get to the num that comes after the char.
    let char = str[i++];
      // the num is a string so multiple digits need to be concatenated before
      // converted to a number. '1' + '1' => '11'. 1 + 1 => 2
    let numStr = "";
    /* 
    parseInt returns NaN if it fails to parse. NaN is a weird special value
    that requires using isNaN to check b/c NaN === NaN => false.
    */
    let isNumber = isNaN(parseInt(str[i])) === false;

    /* 
    Iterate over all the nums that come after this string until the next
    non-number.
      */
    while (i < str.length && isNumber) {
        // concatenate the string-num digit then increment.
        numStr += str[i++];
        isNumber = isNaN(parseInt(str[i])) === false;
    }

      // .repeat will automatically convert numStr to a number if it can.
    decoded += char.repeat(numStr);
    }
    return decoded;
}
console.log(decodeStr(two_str1))
console.log(decodeStr(two_str2))