/* 
 * Description - AngularJS Controller Script To Initialize The Date-picker
 * Created By - Yatin Batra  
 * */

var mainApp = angular.module("diffabapp", []);

mainApp.directive("datepicker", function () {

	function link(scope, element, attrs, controller) {

		// CALLING THE "datepicker()" METHOD USING THE "element" OBJECT
		element.datepicker({
			onSelect: function (val) {
				scope.$apply(function () {

					// UPDATING THE VIEW VALUE WITH THE SELECTED DATE
					controller.$setViewValue(val);   
				});
			},
			dateFormat: "dd-mm-yy"
		});
	}

	return {
		require: 'ngModel',
		link: link
	};
});