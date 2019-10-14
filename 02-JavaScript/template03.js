var helpers = require( './helpers' );
var part = require( './csce322a02part03' );

var maze = helpers.readMazeFile( 'part03test01.maze.scm' );
var moves = helpers.readMovesFile( 'part03test01.moves.scm' );

var theFunction = part.manyPlayersOneSlide( maze );
console.log( "BEFORE" );
helpers.printMaze( maze );
var after = theFunction( moves );
console.log( "AFTER" );
helpers.printMaze( after );
