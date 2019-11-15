var helpers = require( './helpers' );
var part = require( './csce322a02part02' );

var maze = helpers.readMazeFile( 'part02test01.maze.scm' );
var moves = helpers.readMovesFile( 'part02test01.moves.scm' );

var theFunction = part.onePlayerManySlides( maze );
console.log( "BEFORE" );
helpers.printMaze( maze );
var after = theFunction( moves );
console.log( "AFTER" );
helpers.printMaze( after );
