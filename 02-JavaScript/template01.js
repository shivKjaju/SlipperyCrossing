var helpers = require( './helpers' );
var part = require( './csce322a02part01' );

var maze = helpers.readMazeFile( 'part01test01.maze.scm' );
var moves = helpers.readMovesFile( 'part01test01.moves.scm' );

var theFunction = part.onePlayerOneSlide( maze );
console.log( "BEFORE" );
helpers.printMaze( maze );
var after = theFunction( moves[0] );
console.log( "AFTER" );
helpers.printMaze( after );
