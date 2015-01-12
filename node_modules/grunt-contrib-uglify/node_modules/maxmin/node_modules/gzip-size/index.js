'use strict';
var gzip = require('zlib').gzip;
var gzipSync = require('zlib-browserify').gzipSync;

module.exports = function (str, cb) {
	if (!str) {
		return cb(0);
	}

	gzip(str, function (err, data) {
		cb(err, data.length);
	});
};

module.exports.sync = function (str) {
	return gzipSync(str).length;
};
