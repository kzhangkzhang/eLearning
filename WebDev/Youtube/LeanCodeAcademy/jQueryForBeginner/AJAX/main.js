$(function() {

	var $orders = $('#orders');
	var $name = $('#name');
	var $drink = $('#drink');

	var orderTemplate = $('#order-template').html();

	function addOrder(order) {
		$orders.prepend(Mustache.render(orderTemplate, order));
	}


	$.ajax({
		type: 'GET',
		url: 'http://rest.learncode.academy/api/learncode/orders',
		success: function(orders) {
			//console.log(orders);

			$.each(orders, function(i, order) {
				addOrder(order);
				})	//end of each method
		}, //end of success function
		error: function() {
			alert('error loading orders');
		}
	});	//end of ajax function
	

	$('#add-order').on('click', function() {
		var newOrder = {
			name: $name.val(),
			drink: $drink.val()
		};

		$.ajax({
			type: 'POST',
			url: 'http://rest.learncode.academy/api/learncode/orders',
			data: newOrder,
			success: function(newAddedOrder) {
				//alert('new order added');

				addOrder(newAddedOrder);	
			},
			error: function() {
				alert('error add saving order');

			}
		});
	}); 		//end of add-order click event handler

	$orders.delegate('.remove', 'click', function() {
		var $li = $(this).closest('li');

		$.ajax({
			type: 'DELETE',
			url: 'http://rest.learncode.academy/api/learncode/orders/' + $li.attr('data-id'),
			success: function () {
				$li.fadeOut(300, function() {
					$li.remove();
				})
			}
		});


	});			//end of remove event handler

	$orders.delegate('.editOrder', 'click', function() {
		//console.log('start editing ...');
		var $li = $(this).closest('li');

		$li.find('input.name').val( $li.find('span.name').html() );
		$li.find('input.drink').val( $li.find('span.drink').html() );

		$li.addClass('edit');


	});			//end of editOrder event handler	

	$orders.delegate('.cancelEdit', 'click', function() {
		 $(this).closest('li').removeClass('edit');	
	});			//end of Edit Order event handler	


	$orders.delegate('.saveEdit', 'click', function() {
		 var $li = $(this).closest('li');
		 var updatedOrder = {
		 	name: $li.find('input.name').val(),
		 	drink: $li.find('input.drink').val()
		 };

		$.ajax({
			type: 'PUT',
			url: 'http://rest.learncode.academy/api/learncode/orders/' + $li.attr('data-id'),
			data: updatedOrder,
			success: function(newAddedOrder) {
				$li.find('span.name').html(updatedOrder.name);
				$li.find('span.drink').html(updatedOrder.drink);
				$li.removeClass('edit');
			},
			error: function() {
				alert('error updating order');
			}
		});		 
	});		// edn of saveEdit event handler

}); //end of document ready function