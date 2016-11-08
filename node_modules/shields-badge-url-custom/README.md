Custom Badge URLs
===
[![NPM version][npm-image]][npm-url] [![Build Status][build-image]][build-url] [![Coverage Status][coverage-image]][coverage-url] [![Dependencies][dependencies-image]][dependencies-url]

> Creates [Shields.io][shields] badge URLs for custom badges.


## Installation

``` bash
$ npm install shields-badge-url-custom
```


## Usage

``` javascript
var urls = require( 'shields-badge-url-custom' );
```

#### urls( opts )

Creates [Shields.io][shields] badge URLs for custom badges.

``` javascript
var opts = {
	'label': 'build',
	'status': 'passing',
	'color': 'brightgreen'
};

var out = urls( opts );
/*
	{
		"image": "https://img.shields.io/badge/build-passing-brightgreen.svg?style=flat"
	}
*/ 
```

The `function` accepts the following `options`:
*	__label__: (*required*) badge label.
*	__status__: (*required*) badge status.
*	__color__: (*required*) badge color. A color may be either a named (e.g., `brightgreen`, `green`, `yellow`, `red`, etc) or HEX (e.g., `474747`, `eeeeee`, etc).
*	__style__: badge style. Default: `flat`.
*	__format__: badge format. Default: `svg`.
*	__logo__: badge logo (>= 14px high and provided as a [data URI][data-uri]).
*	__width__: badge width (pixels).
*	__llink__: left side link. (note: must be provided with a right side link.)
*	__rlink__: right side link. (note: must be provided with a left side link.)


## Examples

``` javascript
var mnames = require( 'datasets-male-first-names-en' );
var fnames = require( 'datasets-female-first-names-en' );
var randc = require( 'rand-color-hexadecimal' );
var urls = require( 'shields-badge-url-custom' );

// Badges for everyone! Create random personalized greeting badges...
var badge;
var len;
var idx;
var n;
var i;

len = mnames.length + fnames.length;
for ( i = 0; i < len; i++ ) {
	if ( len%2 === 0 ) {
		idx = Math.floor( Math.random()*fnames.length );
		n = fnames[ idx ];
	} else {
		idx = Math.floor( Math.random()*mnames.length );
		n = mnames[ idx ];
	}
	badge = urls({
		'label': 'Hello,',
		'status': n + '!',
		'color': randc()
	});
	console.log( badge );
}
```

To run the example code from the top-level application directory,

``` bash
$ node ./examples/index.js
```


---
## CLI

### Installation

To use the module as a general utility, install the module globally

``` bash
$ npm install -g shields-badge-url-custom
```


### Usage

``` bash
Usage: shields-custom --label=<label> --status=<status> --color=<color> [options]

Options:

  -h,  --help                Print this message.
  -V,  --version             Print the package version.
       --label label         Badge label.
       --status status       Badge status.
       --color color         Badge color.
       --style style         Badge style. Default: 'flat'.
       --format format       Badge format. Default: 'svg'.
       --logo logo           Badge logo.
       --width width         Badge logo width (pixels).
       --llink link          Left side badge link.
       --rlink link          Right side badge link.
```


### Examples

``` bash
$ shields-custom --label=beep --status=boop --color="474747"
# => {"image":"https://img.shields.io/badge/beep-boop-474747.svg?style=flat"}
```


---
## Tests

### Unit

This repository uses [tape][tape] for unit tests. To run the tests, execute the following command in the top-level application directory:

``` bash
$ make test
```

All new feature development should have corresponding unit tests to validate correct functionality.


### Test Coverage

This repository uses [Istanbul][istanbul] as its code coverage tool. To generate a test coverage report, execute the following command in the top-level application directory:

``` bash
$ make test-cov
```

Istanbul creates a `./reports/coverage` directory. To access an HTML version of the report,

``` bash
$ make view-cov
```


### Browser Support

This repository uses [Testling][testling] for browser testing. To run the tests in a (headless) local web browser, execute the following command in the top-level application directory:

``` bash
$ make test-browsers
```

To view the tests in a local web browser,

``` bash
$ make view-browser-tests
```

<!-- [![browser support][browsers-image]][browsers-url] -->


---
## License

[MIT license](http://opensource.org/licenses/MIT).


## Copyright

Copyright &copy; 2016. Athan Reines.


[npm-image]: http://img.shields.io/npm/v/shields-badge-url-custom.svg
[npm-url]: https://npmjs.org/package/shields-badge-url-custom

[build-image]: http://img.shields.io/travis/kgryte/shields-badge-url-custom/master.svg
[build-url]: https://travis-ci.org/kgryte/shields-badge-url-custom

[coverage-image]: https://img.shields.io/codecov/c/github/kgryte/shields-badge-url-custom/master.svg
[coverage-url]: https://codecov.io/github/kgryte/shields-badge-url-custom?branch=master

[dependencies-image]: http://img.shields.io/david/kgryte/shields-badge-url-custom.svg
[dependencies-url]: https://david-dm.org/kgryte/shields-badge-url-custom

[dev-dependencies-image]: http://img.shields.io/david/dev/kgryte/shields-badge-url-custom.svg
[dev-dependencies-url]: https://david-dm.org/dev/kgryte/shields-badge-url-custom

[github-issues-image]: http://img.shields.io/github/issues/kgryte/shields-badge-url-custom.svg
[github-issues-url]: https://github.com/kgryte/shields-badge-url-custom/issues

[tape]: https://github.com/substack/tape
[istanbul]: https://github.com/gotwarlost/istanbul
[testling]: https://ci.testling.com
[npm]: https://npmjs.com
[shields]: http://shields.io/

[data-uri]: https://developer.mozilla.org/en-US/docs/Web/HTTP/data_URIs
