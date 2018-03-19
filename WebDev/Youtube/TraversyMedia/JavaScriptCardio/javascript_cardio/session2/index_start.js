// CHALLENGE 1: LONGEST WORD
// Return the longest word of a string
// ex. longestWord('Hi there, my name is Brad') === 'there,'

function longestWord(sen) {
  // SOLUTION 1 - Return a single longest word
  // SOLUTION 2 - Return an array and include multiple words if they have the same length
  // SOLUTION 3 - Only return an array if multiple words, otherwise return a string
}

// CHALLENGE 2: ARRAY CHUNKING
// Split an array into chunked arrays of a specific length
// ex. chunkArray([1, 2, 3, 4, 5, 6, 7], 3) === [[1, 2, 3],[4, 5, 6],[7]]
// ex. chunkArray([1, 2, 3, 4, 5, 6, 7], 2) === [[1, 2],[3, 4],[5, 6],[7]]

function chunkArray(arr, len) {

  // // solution A: while loop

  // // init chuck array
  // const chunkedArr = [];
  // // set index 
  // let i = 0;
  // let count = 0;

  // // Loop while index is less than array length
  // while (i < arr.length){
  //   // slice out from the index to the index + chuck length
  //   // and push on to the chuck array
  //   chunkedArr.push(arr.slice(i, i+len));
  //   i += len;
  //   count += 1;
  //   console.log('loop ' + count + ' i value = ' + i);
  // }
 
  // return chunkedArr;

  // Solution B: forEach()

  // Init chunked arr
  const chunkedArr = [];

  // Loop through arr
  arr.forEach(val => {
    console.log('==> Start the loop ...');
    // Get last element
    const last = chunkedArr[chunkedArr.length - 1];

    console.log('the last value = ' + last);

    // Check if last and if last length is equal to the chunk len
    if (!last || last.length === len) {
      console.log('========= in if =========');
      console.log('value for [val] is ' + [val]);
      chunkedArr.push([val]);
      console.log('chunkedArry is ');
      console.log(chunkedArr);
    } else {
      console.log('======= in else =========');
      console.log('value for [val] is ' + [val]);
      last.push(val);
      console.log('chunkedArry is ');
      console.log(chunkedArr);
    }

    console.log('==> end of loop\n');
  });

  return chunkedArr;
}

// CHALLENGE 3: FLATTEN ARRAY
// Take an array of arrays and flatten to a single array
// ex. [[1, 2], [3, 4], [5, 6], [7]] = [1, 2, 3, 4, 5, 6, 7]

function flattenArray(arrays) {

  // solution A
  //  return arrays.reduce((a,b) => a.concat(b));

  // Solution B
  // return [].concat.apply([], arrays);

  // Solutin C


}

// CHALLENGE 4: ANAGRAM
// Return true if anagram and false if not
// ex. 'elbow' === 'below'
// ex. 'Dormitory' === 'dirty room##'

function isAnagram(str1, str2) {
  // console.log(formatStr(str1));
  return (formatStr(str1) === formatStr(str2));
}

// Helper function
function formatStr(str){

  return str.replace(/[^\w]/g, '').toLowerCase().split('').sort().join('')
}

// CHALLENGE 5: LETTER CHANGES
// Change every letter of the string to the one that follows it and capitalize the vowels
// Z should turn to A
// ex. 'hello there' === 'Ifmmp UIfsf'

function letterChanges(str) {
  let newStr = str.toLowerCase().replace(/[a-z]/gi, char => {
    if(char === 'z' || char === 'Z'){
      return 'a';
    } else {
      return String.fromCharCode(char.charCodeAt() + 1);
    }
  })

  newStr = newStr.replace(/a|e|i|o|u/gi, vowel => vowel.toUpperCase());

  return newStr;
}

// Call Function
const output = letterChanges('Hello Therez');

console.log(output);
