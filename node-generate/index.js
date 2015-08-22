var http = require('http'),
	fs = require('fs'),
	s = require('string'),
	async = require('async');

var functions_file_path = process.argv[2];
if (!functions_file_path) { console.log("You must specify a raw functions txt file"); return; }

console.log('Running');

var prefix = '<NotepadPlus>\n\t<AutoComplete language="MTA-Lua">\n\t<Environment startFunc="(" endFunc=")" paramSeparator="," terminal=";" additionalWordChar = "."/>';
var suffix = '\n\t</AutoComplete>\n</NotepadPlus>';

var ac_file = fs.openSync('MTA-Lua.xml', 'w');
fs.writeSync(ac_file, prefix);
console.log('Reading raw functions file');
var functions = fs.readFileSync(functions_file_path, 'utf8');
if (!functions) { console.log("Functions file not found"); return; }
var lines = functions.split(/(?:\n|\r\n|\r)/g);

// var functions_file = fs.openSync('functions.txt', 'w');

lines.forEach(function(name, i) {
	var url_name = name.charAt(0).toUpperCase() + name.substring(1);
	lines[i] = {host: 'wiki.mtasa.com', port: 80, path: '/wiki/' + url_name, name: name};
});

console.log('Retrieving functions\' syntax');
async.mapSeries(lines, function(item, callback) {
	http.get(item, function(res) {
		var page_content = '';
		res.on('error', function(err) {
			console.log(err);
		})
		res.on('data', function(chunk) { page_content += chunk; });
		res.on('end', function() {
			var function_syntax = s(page_content).between('<!-- PLAIN TEXT CODE FOR BOTS |', '|-->');
			console.log(item.name);
			callback(null, {syntax: function_syntax, name: item.name});
		});
	});
}, function(err, functions) {
	functions.forEach(function(function_data, i) {
		var syntax = function_data.syntax, name = function_data.name;
		// fs.writeSync(functions_file, syntax + '\r\n');
		var args = syntax.between('(', ')').trim().collapseWhitespace().split(',');
		args.forEach(function(arg, i) { args[i] = s(arg).trim().s; });
		var retval = syntax.left(syntax.indexOf(' '));
		var ac_data = '\n\t\t<KeyWord name="' + name + '" func="yes">';
		ac_data += '\n\t\t\t<Overload retVal="' + retval + '">';
		for (i = 0; i < args.length; i++)
			ac_data += '\n\t\t\t\t<Param name="' + args[i] + '"/>';
		ac_data += '\n\t\t\t</Overload>';
		ac_data += '\n\t\t</KeyWord>';
		fs.writeSync(ac_file, ac_data);
	});
	fs.writeSync(ac_file, suffix);
	console.log('Done');
});
