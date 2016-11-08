'use strict';

// VARIABLES //

var RE = /[-_]/g;


// ESCAPE //

/**
* FUNCTION: escape( str )
*	Escapes a string for badge creation.
*
* @param {String} str - string to escape
* @returns {String} escaped string
*/
function escape( str ) {
	return str.replace( RE, '$&$&' );
} // end FUNCTION escape()


// EXPORTS //

module.exports = escape;
