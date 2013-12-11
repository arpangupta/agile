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
				case 'med':
					sudokuPuzzle = generator.generateHardPuzzle();
					break;
			}
			return sudokuPuzzle;
		}
		
		
	}

}