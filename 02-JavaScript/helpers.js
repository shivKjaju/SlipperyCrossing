module.exports = {
    readMazeFile: readMazeFile,
    readMovesFile: readMovesFile,
    printMaze: printMaze
};

function readMazeFile(file)
{
    var text;
    var lines = new Array();
    var rows = new Array();
    var filesystem = require('fs');

    text = filesystem.readFileSync(file);
    lines = text.toString().split("\n");

    for (var r = 0; r < lines.length; r++) {
        rows[r] = lines[r].split(",");
    }
    
    rows.splice( rows.length - 1 , 1 );

    return rows;
}

function readMovesFile(file)
{
    var moves = new Array();
    var filesystem = require('fs');
    var line = filesystem.readFileSync(file);
    moves = line.toString().split("\n");
    
    return moves[0];
}

function printMaze( maze ){
    var m = [];
    for( var r = 0; r < maze.length; r++ ){
	row = "";
	for( var c = 0; c < maze[0].length; c++ ){
	    row = row + maze[r][c];
	}
	console.log( row );
    }
}
