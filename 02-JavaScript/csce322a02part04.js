module.exports = {
    manyPlayersManySlides: manyPlayersManySlides
}

var helpers = require( './helpers' );

function manyPlayersManySlides(maze){
    
    function whatever(moves){
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
        var update = false;

        for (var k = 0; k < moves.length; k++){


            if (count != 0) {
                m = mapAsc.get(z)['i'];
                n = mapAsc.get(z)['j'];
                count = count - 1;
                if (count == 0) {
                    count = mapAsc.size;
                    update = true;
                
                }
            }


            if (moves[k] == 'l') {
                while (maze[m][n - 1] == '-' || maze[m][n-1] == 'g') {
                    if (maze[m][n - 1] == '-') {
                        temp = maze[m][n];
                        maze[m][n] = maze[m][n - 1];
                        maze[m][n - 1] = temp;
                        mapAsc.set(z, { i: Number(m), j: Number(n - 1) });
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
                        mapAsc.set(z, { i: Number(m), j: Number(n + 1) });
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
                        mapAsc.set(z, { i: Number(m - 1), j: Number(n) });
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
                        mapAsc.set(z, { i: Number(m + 1), j: Number(n) });
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
            if (update == false) {
                z = z + 1;
            }
            else {
                z = 1;
                update = false;
            }
        }
	return maze;
    }

    return whatever;
}
