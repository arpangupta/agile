package  
{
	/**
	 * ...
	 * @author Arpan
	 */
	
	import flash.display.Sprite;
    import flash.text.*;
	import flash.events.Event;
	public class puzzleGenerator 
	{
		
		public function puzzleGenerator() 
		{
			
		}
		
		public function generateEasyPuzzle(): puzzle {
			//It makes an object of the the puzzle, populates the appropriate values and returns it
			trace("Generating Easy Puzzle");
			var sudokuPuzzle:puzzle = new puzzle();
			
			sudokuPuzzle.board = generateBoard();
			var board_array = new Array();
			for (var i:int = 0; i < 81; ++i)
			{
				board_array.push(sudokuPuzzle.board[i].getValue());
			}
			trace( board_array );
			
			
			while(sudokuPuzzle.perm_ind.length < 50)
			{
				var next_rand:int = Math.floor((Math.random() * 80) ); 
				if (sudokuPuzzle.perm_ind.indexOf(next_rand  ) <= -1)
				{
					sudokuPuzzle.perm_ind.push(next_rand);
				}
			}
			sudokuPuzzle.perm_ind.sort(Array.NUMERIC);
			trace(sudokuPuzzle.perm_ind);
			
			//generate the player's board now
			for ( var i : int = 0; i < 81; ++i )
			{
				if ( sudokuPuzzle.perm_ind.indexOf(i) > -1 )
					sudokuPuzzle.player_board.push( sudokuPuzzle.board[i]);
				else sudokuPuzzle.player_board.push( new square(0)) ;
			}
			
			//Just for printing
			var player_board1:Array = new Array();
			for ( var j : int = 0; j < 81; ++j )
			{
				
				player_board1.push(sudokuPuzzle.player_board[j].getValue());
			}
			trace(player_board1);
			
			return sudokuPuzzle;
		}
		
		public function generateMedPuzzle():puzzle {
			//It makes an object of the the puzzle, populates the appropriate values and returns it
			trace("Generating Med Puzzle");
			var sudokuPuzzle:puzzle = new puzzle();
			
			sudokuPuzzle.board = generateBoard();
			
			//for printing
			var board_array = new Array();
			for (var i:int = 0; i < 81; ++i)
			{
				board_array.push(sudokuPuzzle.board[i].getValue());
			}
			trace( board_array );
			
			
			while(sudokuPuzzle.perm_ind.length < 40)
			{
				var next_rand:int = Math.floor((Math.random() * 80) ); 
				if (sudokuPuzzle.perm_ind.indexOf(next_rand  ) <= -1)
				{
					sudokuPuzzle.perm_ind.push(next_rand);
				}
			}
			sudokuPuzzle.perm_ind.sort(Array.NUMERIC);
			trace(sudokuPuzzle.perm_ind);
			
			//generate the player's board now
			for ( var i : int = 0; i < 81; ++i )
			{
				if ( sudokuPuzzle.perm_ind.indexOf(i) > -1 )
					sudokuPuzzle.player_board.push( sudokuPuzzle.board[i]);
				else sudokuPuzzle.player_board.push( new square(0)) ;
			}
			
			//Just for printing
			var player_board1:Array = new Array();
			for ( var j : int = 0; j < 81; ++j )
			{
				
				player_board1.push(sudokuPuzzle.player_board[j].getValue());
			}
			trace(player_board1);
			
			return sudokuPuzzle;
		}
		
		public function generateHardPuzzle():puzzle {
			//It makes an object of the the puzzle, populates the appropriate values and returns it
			trace("Generating Hard Puzzle");
			var sudokuPuzzle:puzzle = new puzzle();
			
			sudokuPuzzle.board = generateBoard();
			var board_array = new Array();
			for (var i:int = 0; i < 81; ++i)
			{
				board_array.push(sudokuPuzzle.board[i].getValue());
			}
			trace( board_array );
			
			
			while(sudokuPuzzle.perm_ind.length < 30)
			{
				var next_rand:int = Math.floor((Math.random() * 80) ); 
				if (sudokuPuzzle.perm_ind.indexOf(next_rand  ) <= -1)
				{
					sudokuPuzzle.perm_ind.push(next_rand);
				}
			}
			sudokuPuzzle.perm_ind.sort(Array.NUMERIC);
			trace(sudokuPuzzle.perm_ind);
			
			//generate the player's board now
			for ( var i : int = 0; i < 81; ++i )
			{
				if ( sudokuPuzzle.perm_ind.indexOf(i) > -1 )
					sudokuPuzzle.player_board.push( sudokuPuzzle.board[i]);
				else sudokuPuzzle.player_board.push( new square(0)) ;
			}
			
			//Just for printing
			var player_board1:Array = new Array();
			for ( var j : int = 0; j < 81; ++j )
			{
				
				player_board1.push(sudokuPuzzle.player_board[j].getValue());
			}
			trace(player_board1);
			
			return sudokuPuzzle;
		}
		
		public function next_random(possible: Array) : int {
            var mai = 9;
            var min_choices = 0;
            for (var i=0; i<=80; i++) {
                if (possible[i]!=undefined) {
                    if ((possible[i].length<=mai) && (possible[i].length>0)) {
                        mai = possible[i].length;
                        min_choices = i;
                    }
                }
            }
            return min_choices;
        }
		
		function return_row(cell : int) :int {
            return Math.floor(cell / 9);
        }
		
		 function return_col(cell : int) : int {
            return cell % 9;
        }
		
		function return_block(cell) {
            return Math.floor(return_row(cell) / 3) * 3 + Math.floor(return_col(cell) / 3);
        }
		
		function is_possible_row(number,row,sudoku) {
            var possible = true;
            for (var i=0; i<=8; i++) {
                if (sudoku[row*9+i] == number) {
                    possible = false;
                    break;
                }
            }
            return possible;
        }
        function is_possible_col(number,col,sudoku) {
            var possible = true;
            for (var i=0; i<=8; i++) {
                if (sudoku[col+9*i] == number) {
                    possible = false;
                    break;
                }
            }
            return possible;
        }
        function is_possible_block(number,block,sudoku) {
            var possible = true;
            for (var i=0; i<=8; i++) {
                if (sudoku[Math.floor(block/3)*27+i%3+9*Math.floor(i/3)+3*(block%3)] == number) {
                    possible = false;
                    break;
                }
            }
            return possible;
        }
        function is_possible_number(cell,number,sudoku) {
            var row = return_row(cell);
            var col = return_col(cell);
            var block = return_block(cell);
            return is_possible_row(number,row,sudoku) && is_possible_col(number,col,sudoku) && is_possible_block(number,block,sudoku);
        }
		
		 function is_correct_row(row,sudoku) {
            var right_sequence = new Array(1,2,3,4,5,6,7,8,9);
            var row_temp= new Array();
            for (var i=0; i<=8; i++) {
                row_temp[i] = sudoku[row*9+i];
            }
            row_temp.sort();
            return row_temp.join() == right_sequence.join();
        }
        function is_correct_col(col,sudoku) {
            var right_sequence = new Array(1,2,3,4,5,6,7,8,9);
            var col_temp= new Array();
            for (var i=0; i<=8; i++) {
                col_temp[i] = sudoku[col+i*9];
            }
            col_temp.sort();
            return col_temp.join() == right_sequence.join();
        }
        function is_correct_block(block,sudoku) {
            var right_sequence = new Array(1,2,3,4,5,6,7,8,9);
            var block_temp= new Array();
            for (var i=0; i<=8; i++) {
                block_temp[i] = sudoku[Math.floor(block/3)*27+i%3+9*Math.floor(i/3)+3*(block%3)];
            }
            block_temp.sort();
            return block_temp.join() == right_sequence.join();
        }
        function is_solved_sudoku(sudoku) {
            for (var i=0; i<=8; i++) {
                if (!is_correct_block(i,sudoku) || !is_correct_row(i,sudoku) || !is_correct_col(i,sudoku)) {
                    return false;
                }
            }
            return true;
        }
        function determine_possible_values(cell,sudoku) {
            var possible = new Array();
            for (var i=1; i<=9; i++) {
                if (is_possible_number(cell,i,sudoku)) {
                    possible.unshift(i);
                }
            }
            return possible;
        }
        function determine_random_possible_value(possible,cell) {
            var random_picked = Math.floor(Math.random() * possible[cell].length);
            return possible[cell][random_picked];
        }
		
		function scan_sudoku_for_unique(sudoku) {
            var possible = new Array();
            for (var i=0; i<=80; i++) {
                if (sudoku[i] == 0) {
                    possible[i] = new Array();
                    possible[i] = determine_possible_values(i,sudoku);
                    if (possible[i].length==0) {
                        return false;
                    }
                }
            }
            return possible;
        }
		
		
		public function generateBoard():Array {
			//generate an array of squares and populate them
			trace("Generating a Board");
			var sudoku = new Array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
			var saved = new Array();
            var saved_sud = new Array();
            var i=0;
            var next_move;
            var what_to_try;
            var attempt;
            while (!is_solved_sudoku(sudoku)) {
                i+=1;
                next_move = scan_sudoku_for_unique(sudoku);
                if (next_move == false) {
                    next_move = saved.pop();
                    sudoku = saved_sud.pop();
                }
                what_to_try = next_random(next_move);
                attempt = determine_random_possible_value(next_move,what_to_try);
                if (next_move[what_to_try].length>1) {
                    next_move[what_to_try] = remove_attempt(next_move[what_to_try],attempt);
                    saved.push(next_move.slice());
                    saved_sud.push(sudoku.slice());
                }
                sudoku[what_to_try] = attempt;
            }
	
				var sudoku_board:Array = new Array();
				for ( i = 0; i < 81; ++i)
				{
					sudoku_board.push(new square( sudoku[i]));
				}
				return sudoku_board;
			
				//return sudoku;
		}
		
		 function remove_attempt(attempt_array,number) {
            var new_array = new Array();
            for (var i=0; i<attempt_array.length; i++) {
                if (attempt_array[i] != number) {
                    new_array.unshift(attempt_array[i]);
                }
            }
            return new_array;
        }
		
	}

}