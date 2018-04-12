const countdown = document.querySelector(".countdown");

// Set launch day
const launchDate = new Date("Dec 23, 2018 13:00:00").getTime();

// console.log(launchDate);

// Update every second
const intvl = setInterval(() => {
  // console.log('hi');
  // Get todays date and time (ms)
  const now = new Date().getTime();

  // Distance from now to launch date
  const distance = launchDate - now;
  // console.log(distance);

  // Time calculations
  const days = Math.floor(distance / (1000 * 60 * 60 * 24));
  const hours = Math.floor(
    (distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
  );
  const mins = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  const seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Display the result
  countdown.innerHTML = `
    <div>${days}<span>Days<span></div>
    <div>${hours}<span>Hours<span></div>
    <div>${mins}<span>Minutes<span></div>
    <div>${seconds}<span>Seconds<span></div>
  `;

  // if launch date passed
  if (distance < 0) {
    clearInterval(intvl);
    // Style and output text
    countdown.style.color = "#17a2b8";
    countdown.innerHTML = "Launched";
  }
}, 1000);

// ParticlesJS
// particlesJS.load("particles-js", "./particles.json", function() {
//   console.log("callback - particles.js config loaded");
// });
