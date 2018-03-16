// initial ratings
const ratings = {
  sony: 4.7,
  samsung: 3.4,
  vizio: 2.3,
  panasonic: 3.6,
  phillips: 4.1
};

// Total Stars
const starsTotal = 5;

// Run getRatings when DOM loads
document.addEventListener('DOMContentLoaded', getRatings);

// Form Elements
const productSelect = document.getElementById('product-select');
const ratingControl = document.getElementById('rating-control');

// Init product
let product;

// Product select change
productSelect.addEventListener('change', (e) => {
  product = e.target.value;
  // console.log(product);
  // Enable rating control
  ratingControl.disabled = false;
  ratingControl.value = ratings[product];
});

// Rating Control change
ratingControl.addEventListener('blur', (e) => {
  const rating = e.target.value;

  // Make sure rating is 5 or less
  if (rating > 5) {
    alert('Please rate 1 ~ 5');
    return;
  }

  // Change rating
  ratings[product] = rating;

  // Refresh the rating content
  getRatings();

});


// Get ratings
function getRatings(){
  for(let rating in ratings){
    // console.log(ratings[rating])
    // Get percentage
    const starPercentage = (ratings[rating] / starsTotal) * 100;
    // console.log(starPercentage);

    // Round to nearest 10
    const starPercentageRounded = `${Math.round(starPercentage / 10) * 10}%`;
    // console.log(starPercentageRounded);

    // set width of stars-inner percentage
    document.querySelector(`.${rating} .stars-inner`).style.width = starPercentageRounded;
    
    // Add number rating
    document.querySelector(`.${rating} .number-rating`).innerHTML = ratings[rating];

  }
}