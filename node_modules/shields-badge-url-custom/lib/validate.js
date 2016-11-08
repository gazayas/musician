'use strict';

// MODULES //

var isObject = require( 'validate.io-object' );
var isString = require( 'validate.io-string-primitive' );
var isPositive = require( 'validate.io-positive-primitive' );


// VALIDATE //

/**
* FUNCTION: validate( opts, options )
*	Validates function options.
*
* @param {Object} opts - destination object
* @param {Object} options - function options
* @param {String} options.label - badge label
* @param {String} options.status - badge status
* @param {String} options.color - badge color
* @param {String} [options.logo] - badge logo
* @param {Number} [options.width] - badge logo width (pixels)
* @param {String} [options.llink] - badge left side link
* @param {String} [options.rrlink] - badge right side link
* @param {String} [options.style] - badge style
* @param {String} [options.format] - badge format
* @returns {Error|Null} error object or null
*/
function validate( opts, options ) {
	if ( !isObject( options ) ) {
		return new TypeError( 'invalid argument. Options argument must be an object. Value: `' + options + '`.' );
	}
	opts.label = options.label;
	if ( !isString( opts.label ) ) {
		return new TypeError( 'invalid option. Label option must be a string. Option: `' + opts.label + '`.' );
	}
	opts.status = options.status;
	if ( !isString( opts.status ) ) {
		return new TypeError( 'invalid option. Status option must be a string. Option: `' + opts.status + '`.' );
	}
	opts.color = options.color;
	if ( !isString( opts.color ) ) {
		return new TypeError( 'invalid option. Color option must be a string. Option: `' + opts.color + '`.' );
	}
	if ( options.hasOwnProperty( 'logo' ) ) {
		opts.logo = options.logo;
		if ( !isString( opts.logo ) ) {
			return new TypeError( 'invalid option. Logo option must be a string. Option: `' + opts.logo + '`.' );
		}
	}
	if ( options.hasOwnProperty( 'width' ) ) {
		opts.width = options.width;
		if ( !isPositive( opts.width ) ) {
			return new TypeError( 'invalid option. Logo width option must be a positive number. Option: `' + opts.width + '`.' );
		}
	}
	if ( options.hasOwnProperty( 'llink' ) ) {
		opts.llink = options.llink;
		if ( !isString( opts.llink ) ) {
			return new TypeError( 'invalid option. Left-side link option must be a string. Option: `' + opts.llink + '`.' );
		}
	}
	if ( options.hasOwnProperty( 'rlink' ) ) {
		opts.rlink = options.rlink;
		if ( !isString( opts.rlink ) ) {
			return new TypeError( 'invalid option. Right-side link option must be a string. Option: `' + opts.rlink + '`.' );
		}
	}
	if (
		( opts.llink && !opts.rlink ) ||
		( !opts.llink && opts.rlink )
	) {
		return new Error( 'invalid options. If a left-side link is provided, a right-side link must also be provided, and vice versa. Left-side: `' + opts.llink + '`. Right-side: `' + opts.rlink + '`.' );
	}
	if ( options.hasOwnProperty( 'style' ) ) {
		opts.style = options.style;
		if ( !isString( opts.style ) ) {
			return new TypeError( 'invalid option. Style option must be a string. Option: `' + opts.style + '`.' );
		}
	}
	if ( options.hasOwnProperty( 'format' ) ) {
		opts.format = options.format;
		if ( !isString( opts.format ) ) {
			return new TypeError( 'invalid option. Format option must be a string. Option: `' + opts.format + '`.' );
		}
	}
	return null;
} // end FUNCTION validate()


// EXPORTS //

module.exports = validate;
