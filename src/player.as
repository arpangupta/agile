package  
{
	/**
	 * ...
	 * @author Arpan
	 */
	public class player 
	{
		public var sudokuPuzzle:puzzle;
		public function player() 
		{
			
		}
		
		public function chooseAndGeneratePuzzle(type:String)
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
		}
		
	}

}