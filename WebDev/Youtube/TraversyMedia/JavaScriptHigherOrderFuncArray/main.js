const companies= [
  {name: "Company One",   category: "Finance",    start: 1981, end: 2004},
  {name: "Company Two",   category: "Retail",     start: 1992, end: 2008},
  {name: "Company Three", category: "Auto",       start: 1999, end: 2007},
  {name: "Company Four",  category: "Retail",     start: 1989, end: 2010},
  {name: "Company Five",  category: "Technology", start: 2009, end: 2014},
  {name: "Company Six",   category: "Finance",    start: 1987, end: 2010},
  {name: "Company Seven", category: "Auto",       start: 1986, end: 1996},
  {name: "Company Eight", category: "Technology", start: 2011, end: 2016},
  {name: "Company Nine",  category: "Retail",     start: 1981, end: 1989}
];

const ages = [33, 12, 20, 16, 5, 54, 21, 44, 61, 13, 15, 45, 25, 64, 32];

// standard for loop
// for (let i = 0 ; i < companies.length; i++){
//   console.log(companies[i]);
//  }

// =====================================================================================
// forEach()
// =====================================================================================

companies.forEach(function(company){
  console.log(  'Company Name:' + company.name 
              + '- Category: ' + company.category  
              + '- Age: ' + (parseInt(company.end) - parseInt(company.start))
            );
})

// =====================================================================================
// filter()
// =====================================================================================

// get 21 or older
// let canDrink = [];
// for (let i = 0; i < ages.length; i++){
//   if(ages[i] >= 21){
//     canDrink.push(ages[i]);
//   }
// }

// const canDrink = ages.filter(function(age){
//   if(age >=21) {
//     return true;
//   }
// })

// same as above
const canDrink = ages.filter(age => age >= 21);
// console.log(canDrink);

// filter out retail companies
const retailCompanies = companies.filter(company => company.category.toLowerCase() === 'retail');
// console.log(retailCompanies);

// get 80s companies
const eightiesCompanies = companies.filter(company => parseInt(company.start) >= 1980 && parseInt(company.start) < 1990);
//console.log(eightiesCompanies);

// companies last >= 10 years
const lastedTenYrsCompanies = companies.filter(company => parseInt(company.end) - parseInt(company.start) >= 10);
//console.log(lastedTenYrsCompanies);

// =====================================================================================
// Map()
// =====================================================================================

// Create a new array of company names
const companyNames = companies.map(company => company.name);
//console.log(companyNames);

const testMap = companies.map(company => `${company.name} start-end: ${company.start} - ${company.end}`);
//console.log(testMap);

// square of ages
const agesSquare = ages.map(age => Math.sqrt(age));
//console.log(agesSquare);

const agesDouble = ages.map(age => age * 2);
//console.log(agesDouble);

const ageMap = ages.map(age => Math.sqrt(age))
                   .map(age => age * 2);
//console.log(ageMap);
   
// =====================================================================================
// sort()
// =====================================================================================

// sort companies by start year
const sortedComanpanies = companies.sort((companyX, companyY) => companyX.start - companyY.start);
//console.log(sortedComanpanies);

// sort ages
// ascending order
const sortedAscAges = ages.sort((a,b) => a - b);
//console.log(sortedAscAges);
// descending order
const sortedDescAges = ages.sort((a,b) => b -a);
//console.log(sortedDescAges);

// =====================================================================================
// reduce()
// =====================================================================================

// add all ages together

// traditional way
let ageSum = 0;

for (let i = 0; i < ages.length; i++){
  ageSum += ages[i];
}
//console.log('age sum = ' + ageSum);

let ageSum2 = 0;

ageSum2 = ages.reduce((total,age) => total + age);
//console.log('age sum = ' + ageSum2);

// get total years for all companies
const totalYrs = companies.reduce((total, company) => total + (company.end - company.start), 0);
//console.log('total years for all companies: ' + totalYrs);

// Combined Methods
const combinedValue = ages
                        .map(age => age * 2)
                        .filter(age => age >= 40)
                        .sort((a,b) => a - b)
                        .reduce((a,b) => a + b, 0);

console.log(combinedValue);
