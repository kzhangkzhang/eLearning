var myName = 'Kevin Zhang';
var myNumber = '123,45';

var myNewNumber = parseFloat(myNumber.replace(/,/g, '*')) || 0;
var myNewNumber2 = myNumber.replace(/,/g, '*');

console.log('my name is ' + myName);

console.log('myNumber ' + myNumber);

console.log('myNewNumber2 ' + myNewNumber2);

function toggleImage() {
  var img = document.getElementById('knowleslogo');

  var isImgVisible = img.style.visibility != 'visible';

  img.style.visibility = isImgVisible ? 'visible' : '';
}

function init() {
  var h1tags = document.getElementsByTagName('h1');
  h1tags[0].onclick = changeColor;
}

function changeColor() {
  this.innerHTML = 'Color change is done by javascript';
  var randomColor = '#' + Math.floor(Math.random() * 16777215).toString(16);
  this.style.color = randomColor;
}

function update_order_qty() {

  // Kevin Zhang 2-June2-2015
  // jQuery syntax is heavily used in this script
  var line_order_qty_tot = 0;

  $('input[name=f06]').each(function () {
    line_order_qty_tot += parseInt($(this).val());
  });

  // make sure this field is enabled for editting, given you have a dynamic
  // action defined for it to not allow end user to edit it
  $('#P46_ISSUEQTY').removeAttr('disabled');

  apex.item('P46_ISSUEQTY').setValue(line_order_qty_tot);

  var plan_order_qty = apex.item('P46_FGQTY').getValue();

  if (plan_order_qty > line_order_qty_tot) {
    apex.confirm(`Plan Qty (${plan_order_qty}) > total Chip Issue Qty {${line_order_qty_tot}): Are you sure?`, 'SAVE');
  } else {
    apex.submit('SAVE');
  }
}