Positive Primitive
===
[![NPM version][npm-image]][npm-url] [![Build Status][travis-image]][travis-url] [![Coverage Status][coveralls-image]][coveralls-url] [![Dependencies][dependencies-image]][dependencies-url]

> Validates if a value is a positive number primitive.


## Installation

``` bash
$ npm install validate.io-positive-primitive
```

For use in the browser, use [browserify](https://github.com/substack/node-browserify).


## Usage

``` javascript
var isPositive = require( 'validate.io-positive-primitive' );
```

#### isPositive( value )

Validates if a `value` is a positive `number` primitive.

``` javascript
var value = Math.PI;

var bool = isPositive( value );
// returns true
```


## Examples

``` javascript
var isPositive = require( 'validate.io-positive-primitive' );

console.log( isPositive( 5 ) );
// returns true

console.log( isPositive( Math.PI ) );
// returns true

console.log( isPositive( 0 ) );
// returns false

console.log( isPositive( -5 ) );
// returns false

console.log( isPositive( new Number( 5 ) ) );
// returns false
```

To run the example code from the top-level application directory,

``` bash
$ node ./examples/index.js
```


## Tests

### Unit

Unit tests use the [Mocha](http://mochajs.org) test framework with [Chai](http://chaijs.com) assertions. To run the tests, execute the following command in the top-level application directory:

``` bash
$ make test
```

All new feature development should have corresponding unit tests to validate correct functionality.


### Test Coverage

This repository uses [Istanbul](https://github.com/gotwarlost/istanbul) as its code coverage tool. To generate a test coverage report, execute the following command in the top-level application directory:

``` bash
$ make test-cov
```

Istanbul creates a `./reports/coverage` directory. To access an HTML version of the report,

``` bash
$ make view-cov
```


---
## License

[MIT license](http://opensource.org/licenses/MIT). 


## Copyright

Copyright &copy; 2015. Athan Reines.


[npm-image]: http://img.shields.io/npm/v/validate.io-positive-primitive.svg
[npm-url]: https://npmjs.org/package/validate.io-positive-primitive

[travis-image]: http://img.shields.io/travis/validate-io/positive-primitive/master.svg
[travis-url]: https://travis-ci.org/validate-io/positive-primitive

[coveralls-image]: https://img.shields.io/coveralls/validate-io/positive-primitive/master.svg
[coveralls-url]: https://coveralls.io/r/validate-io/positive-primitive?branch=master

[dependencies-image]: http://img.shields.io/david/validate-io/positive-primitive.svg
[dependencies-url]: https://david-dm.org/validate-io/positive-primitive

[dev-dependencies-image]: http://img.shields.io/david/dev/validate-io/positive-primitive.svg
[dev-dependencies-url]: https://david-dm.org/dev/validate-io/positive-primitive

[github-issues-image]: http://img.shields.io/github/issues/validate-io/positive-primitive.svg
[github-issues-url]: https://github.com/validate-io/positive-primitive/issues
