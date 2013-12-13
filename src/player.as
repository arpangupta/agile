package  
{
	import flash.globalization.Collator;
	/**
	 * ...
	 * @author Arpan
	 */
	public class player 
	{
		public var sudokuPuzzle:puzzle; // will have the player's as well as the solution board
		public var winStatus:Boolean = false;
		public function player() 
		{
			
		}
		
		public function chooseAndGeneratePuzzle(type:String) : puzzle
		{
			var generator:puzzleGenerator = new puzzleGenerator();
			switch(type)
			{	
				case 'easy':
					sudokuPuzzle = generator.generateEasyPuzzle();
					break;
				case 'med':
					sudokuPuzzle = generator.generateMedPuzzle();
					break;
				case 'hard':
					sudokuPuzzle = generator.generateHardPuzzle();
					break;
			}
			return sudokuPuzzle;
		}
		
		public function endGame() : void
		{
			sudokuPuzzle.board = new Array();
			sudokuPuzzle.perm_ind = new Array();
			sudokuPuzzle.player_board = new Array();
		}
		
		public function setSquare(i : int , j : int, value : int) : String
		{
			if ( !winStatus)
			{
			var index:int = (i * 9) + j;
			if(sudokuPuzzle.perm_ind.indexOf(index) <= -1)
			{
				var player_board_array:Array = new Array();
				for (var i : int = 0; i < sudokuPuzzle.player_board.length; ++i )
				{
					player_board_array.push(sudokuPuzzle.player_board[i].getValue());
				}
				
				trace("Player Board Array : " + player_board_array);
				
				if(!is_possible_number(index, value, player_board_array))
				{				
					return "Duplicate";
				}
				
				else
				{
					
					sudokuPuzzle.player_board[index].value = value;
					if (won())
					{
						winStatus = true;
						return "Won";
					}
					else
					return "Done";
				}
			}	
			else return "Illegal Operation";
			}
			else return "Game Over";
		}
		
		public function won() : Boolean
		{
			if (sudokuPuzzle.board.length == sudokuPuzzle.player_board.length && areEqual(sudokuPuzzle.board, sudokuPuzzle.player_board ))
				return true;
			else return false;
		}
		
		public function areEqual(board1:Array, board2 : Array):Boolean
		{
			var eq:Boolean = true;
			var i:int = 0;
			while(eq && i < board1.length)
			{
				if (board1[i].getValue() != board2[i].getValue())
					eq = false;
					
				++i;
			}
			
			return eq;
		}
		
		public function is_possible_row(number : int,row :int,sudoku : Array):Boolean {
            var possible:Boolean = true;
            for (var i:int=0; i<=8; i++) {
                if (sudoku[row*9+i] == number) {
                    possible = false;
                    break;
                }
            }
            return possible;
        }
        public function is_possible_col(number:int,col:int,sudoku:Array): Boolean {
            var possible:Boolean = true;
            for (var i:int=0; i<=8; i++) {
                if (sudoku[col+9*i] == number) {
                    possible = false;
                    break;
                }
            }
            return possible;
        }
        public function is_possible_block(number:int,block:int,sudoku:Array):Boolean {
            var possible:Boolean = true;
            for (var i:int =0; i<=8; i++) {
                if (sudoku[Math.floor(block/3)*27+i%3+9*Math.floor(i/3)+3*(block%3)] == number) {
                    possible = false;
                    break;
                }
            }
            return possible;
        }
        public function is_possible_number(cell:int,number:int,sudoku:Array) : Boolean {
            var row:int = return_row(cell);
            var col:int = return_col(cell);
            var block:int = return_block(cell);
            return is_possible_row(number,row,sudoku) && is_possible_col(number,col,sudoku) && is_possible_block(number,block,sudoku);
        }
		
		public function return_row(cell : int) :int {
            return Math.floor(cell / 9);
        }
		
		public function return_col(cell : int) : int {
            return cell % 9;
        }
		
		public function return_block(cell:int ): int {
            return Math.floor(return_row(cell) / 3) * 3 + Math.floor(return_col(cell) / 3);
        }
	}

}