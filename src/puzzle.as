package  
{
	/**
	 * It represents the complete Sudoku Puzzle Board and is used by the puzzle generator, it is a composition of square
	 * @author Arpan
	 */
	 
	public class puzzle 
	{
		public var board:Array = new Array(); //the solution board
		public var player_board:Array = new Array();//player's playing board
		public var perm_ind:Array = new Array(); // the permanent indices, that can't be changed
		public function puzzle() 
		{
			//the constructor for the puzzle
			
			trace("Allocating the board");
			
			board = new Array( );
			for (var i:int = 0 ; i < 81; ++i )
			board.push(new square(0));
		
			
			
		}
		
		
		
	}

}