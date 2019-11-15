module.exports = {
    onePlayerManySlides: onePlayerManySlides
}

var helpers = require( './helpers' );

function onePlayerManySlides(maze){
    
    function whatever(moves) {
        var m;
        var n;
        var temp;

        for (var i = 0; i < maze.length; i++) {
            for (var j = 0; j < maze[i].length; j++) {
                if (maze[i][j] == '1') {
                    var m = i;
                    var n = j;
                    break;
                }
            }
        }

        for (var k = 0; k < moves.length; k++) {
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
                        break;
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
                    }
                }
            }
        }
        return maze;    
    }
    
    return whatever;
}