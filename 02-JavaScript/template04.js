var helpers = require( './helpers' );
var part = require( './csce322a02part04' );

var maze = helpers.readMazeFile( 'part04test01.maze.scm' );
var moves = helpers.readMovesFile( 'part04test01.moves.scm' );

var theFunction = part.manyPlayersManySlides( maze );
console.log( "BEFORE" );
helpers.printMaze( maze );
var after = theFunction( moves );
console.log( "AFTER" );
helpers.printMaze( after );
