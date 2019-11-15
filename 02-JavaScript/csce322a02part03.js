module.exports = {
    manyPlayersOneSlide: manyPlayersOneSlide
}

var helpers = require( './helpers' );

function manyPlayersOneSlide(maze){
    
    function whatever(moves) {
        var myMap = new Map();
        var count = 0;
        var temp;
        var k; var m; var n;
        for (var i = 0; i < maze.length; i++) {
            for (var j = 0; j < maze[i].length; j++) {
                if (maze[i][j] != "-" && maze[i][j] != "x" && maze[i][j] != "g") {
                    count = count + 1;
                    myMap.set(Number(maze[i][j]), { i, j });
                }
            }
        }

        moves = moves.replace(/,/g, "");

        var mapAsc = new Map([...myMap.entries()].sort());
        var z = 1;
        for (var k = 0; k < count; k++) {

            
                m = mapAsc.get(z)['i'];
                n = mapAsc.get(z)['j'];
                z = z + 1;
                
            

            if (moves[k] == 'l') {
                while (maze[m][n - 1] == '-' || maze[m][n-1] == 'g') {
                    if (maze[m][n - 1] == '-') {
                        temp = maze[m][n];
                        maze[m][n] = maze[m][n - 1];
                        maze[m][n - 1] = temp;
                        n--;
                    }
                    else {
                        temp = maze[m][n];
                        maze[m][n] = '-';
                        maze[m][n - 1] = temp;
                        return maze;
                    }
                }
                
            }

            if (moves[k] == 'r') {
                while (maze[m][n + 1] == '-' || maze[m][n+1] == 'g') {
                    if (maze[m][n + 1] == '-') {
                        temp = maze[m][n];
                        maze[m][n] = maze[m][n + 1];
                        maze[m][n + 1] = temp;
                        n++;
                    }
                    else {
                        temp = maze[m][n];
                        maze[m][n] = '-';
                        maze[m][n + 1] = temp;
                        return maze;
                    }
                }
                
            }

            if (moves[k] == 'u') {
                while (maze[m - 1][n] == '-' || maze[m-1][n] == 'g') {
                    if (maze[m - 1][n] == '-') {
                        temp = maze[m][n];
                        maze[m][n] = maze[m - 1][n];
                        maze[m - 1][n] = temp;
                        m--;
                    }
                    else {
                        temp = maze[m][n];
                        maze[m][n] = '-';
                        maze[m - 1][n] = temp;
                        return maze;
                    }
                }
                
            }

            if (moves[k] == 'd') {
                while (maze[m + 1][n] == '-' || maze[m+1][n] == 'g') {
                    if (maze[m + 1][n] == '-') {
                        temp = maze[m][n];
                        maze[m][n] = maze[m + 1][n];
                        maze[m + 1][n] = temp;
                        m++;
                    }
                    else {
                        temp = maze[m][n];
                        maze[m][n] = '-';
                        maze[m + 1][n] = temp;
                        return maze;
                    }
                }
            }
        }    

     return maze;    
    }
    return whatever;	
    }