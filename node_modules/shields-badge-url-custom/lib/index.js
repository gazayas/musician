'use strict';

// MODULES //

var mustache = require( 'mustache' );
var validate = require( './validate.js' );
var escape = require( './escape.js' );


// TEMPLATES //

var IMAGE = 'https://img.shields.io/badge/{{label}}-{{status}}-{{color}}.{{format}}?style={{style}}{{#logo}}&logo={{{logo}}}{{/logo}}{{#width}}&logoWidth={{width}}{{/width}}{{#llink}}&link={{{llink}}}{{/llink}}{{#rlink}}&link={{{rlink}}}{{/rlink}}';

mustache.parse( IMAGE );


// URLS //

/**
* FUNCTION: urls( options )
*	Creates Shields.io badge URLs.
*
* @param {Object} options - function options
* @param {String} options.label - badge label
* @param {String} options.status - badge status
* @param {String} options.color - badge color
* @param {String} [options.logo] - badge logo (data URI)
* @param {String} [options.width] - badge logo width (pixels)
* @param {String} [options.llink] - badge left side link
* @param {String} [options.rrlink] - badge right side link
* @param {String} [options.style="flat"] - badge style
* @param {String} [options.format="svg"] - badge format
* @returns {Object}
*/
function urls( options ) {
	var opts;
	var out;
	var err;

	opts = {};
	err = validate( opts, options );
	if ( err ) {
		throw err;
	}
	opts.label = escape( opts.label );
	opts.status = escape( opts.status );
	opts.color = escape( opts.color );
	opts.style = opts.style || 'flat';
	opts.format = opts.format || 'svg';

	out = {};
	out.image = mustache.render( IMAGE, opts );

	return out;
} // end FUNCTION urls()


// EXPORTS //

module.exports = urls;
