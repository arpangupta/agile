package  
{
	/**
	 * ...
	 * @author Arpan
	 */
	public class player 
	{
		public var sudokuPuzzle:puzzle; // will have the player's as well as the solution board
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
			var index:int = (i * 9) + j;
			if(sudokuPuzzle.perm_ind.indexOf(index) <= -1)
			{
				sudokuPuzzle.player_board[index].value = value;
				return "Done";
			}
				
			else return "Illegal Operation";
		}
	}

}