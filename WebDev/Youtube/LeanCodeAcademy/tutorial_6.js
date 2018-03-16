'use strict';

$(function() {

    //setting for slider
    var width           = 720;
    var animationSpeed  = 1000;
    var pause           = 3000;
    var currentSlide    = 1;

    //cache the DOM
    var $slider         = $('#slider');
    var $sliderContainer= $slider.find('.slides');
    var $slides         = $sliderContainer.find('.slide');


    //setInterval
        //animate margin-left
        //if it is last slide, go to position 1 (0px);

        //listen for mouseenter and pause
        //resume on mouseleave   

    var myInterval;

    function startSlider() {

         myInterval = setInterval(function() {
                        $sliderContainer.animate({'margin-left': '-='+720}, animationSpeed, function () {
                            currentSlide++;
                            if (currentSlide === $slides.length) {
                                currentSlide = 1;
                                $sliderContainer.css('margin-left', 0);
                            }
                        });
                    }, pause);

    }


    function stopSlider() {
        clearInterval(myInterval);
    }

    $slider.on('mouseenter', stopSlider)
           .on('mouseleave', startSlider); 

    startSlider();           

});
