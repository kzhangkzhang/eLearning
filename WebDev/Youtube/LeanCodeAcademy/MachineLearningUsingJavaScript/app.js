const brain = require("brain.js");

const network = new brain.NeuralNetwork();

// ===================================================================
// Example 1: predict it is an adult or kid based on height and weight
// ===================================================================

// [68, 150] : 68 lb and 150 cm height ==> this is an adult (1)
// [30, 60] : 30 lb and 60 cm height ==> this is an kid (0)
// You can uncomment out below to study it
// height is inch; weight is lbs
network.train([
  { input: { height: 68, weight: 180 }, output: { adult: 1 } },
  { input: { height: 20, weight: 40 }, output: { kid: 1 } },
  { input: { height: 22, weight: 40 }, output: { kid: 1 } },
  { input: { height: 25, weight: 42 }, output: { kid: 1 } },
  { input: { height: 30, weight: 60 }, output: { kid: 1 } },
  { input: { height: 38, weight: 65 }, output: { kid: 1 } },
  { input: { height: 30, weight: 58 }, output: { kid: 1 } },
  { input: { height: 73, weight: 250 }, output: { adult: 1 } },
  { input: { height: 73, weight: 230 }, output: { adult: 1 } },
  { input: { height: 70, weight: 220 }, output: { adult: 1 } },
  { input: { height: 75, weight: 220 }, output: { adult: 1 } }
]);

const result = network.run({ height: 80, weight: 230 });
console.log(result);

// ===================================================================
// Example 2: predict the color is light or dark based on rgb value
//            rbg value has been divided by 255
// You can copy and paste training input from https://codepen.io/anon/pen/NYRRQm?editors=1111
// ===================================================================
// network.train([
//   { input: { r: 0.62, g: 0.72, b: 0.88 }, output: { light: 1 } },
//   { input: { r: 0.1, g: 0.84, b: 0.72 }, output: { light: 1 } },
//   { input: { r: 0.33, g: 0.24, b: 0.29 }, output: { dark: 1 } },
//   { input: { r: 0.74, g: 0.78, b: 0.86 }, output: { light: 1 } },
//   { input: { r: 0.31, g: 0.35, b: 0.41 }, output: { dark: 1 } },
//   { input: {r: 1, g: 0.99, b: 0}, output: { light: 1 } },
//   { input: {r: 1, g: 0.42, b: 0.52}, output: { dark: 1 } },
// ]);

// const result = network.run({ r: 0, g: 1, b: 0.65 });
// console.log(result);
