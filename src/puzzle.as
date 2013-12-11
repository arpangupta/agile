package  
{
	/**
	 * It represents the complete Sudoku Puzzle Board and is used by the puzzle generator, it is a composition of square
	 * @author Arpan
	 */
	 
	public class puzzle 
	{
		var board:Array; //the solution board
		public function puzzle() 
		{
			trace("Allocating the board");
		//	board = new Array(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
			board = new Array( );
			for (var i = 0 ; i < 81; ++i )
			board.push(new square());
			
		}
		
		
		
	}

}