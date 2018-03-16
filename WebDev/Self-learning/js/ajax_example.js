$(function () {

	var $emptr = $('#emptable tbody');
	var $employees = $('#employees');

	$.ajax({
			url: 'http://knapex:8082/ords/dvoa013/repositoryapex/emp_json/',
			type: 'GET',
			data: {},
			success: function (emps) {
				//console.log('Kevin - ajax is cool:');
				//console.log(emps.items.length);

				$.each(emps.items, function(i, emp) {
  				//iterate through array or object

  			//	$employees.append('<li>Employee Name: '+emp.ename+' Employee #: '+ emp.empno + '</li>');

  			$emptr.append('<tr><td>'+emp.ename+'</td><td>'+emp.empno+ '</td></tr>');
				});
			},
			error: function() {
				/* Act on the event */
				alert('error loading employees');
			}
		});
	
});