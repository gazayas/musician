'use strict';

// MODULES //

var isNumber = require( 'validate.io-number-primitive' );


// IS POSITIVE //

/**
* FUNCTION: isPositive( value )
*	Validates if a value is a positive number primitive.
*
* @param {*} value - value to be validated
* @returns {Boolean} boolean indicating if a value is a positive number primitive
*/
function isPositive( value ) {
	return isNumber( value ) && value > 0;
} // end FUNCTION isPositive()


// EXPORTS //

module.exports = isPositive;
