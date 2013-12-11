package  
{
	/**
	 * It represents the complete Sudoku Puzzle Board and is used by the puzzle generator, it is a composition of square
	 * @author Arpan
	 */
	 
	public class puzzle 
	{
		var board:Array = new Array(); //the solution board
		var player_board:Array = new Array();//player's playing board
		var perm_ind:Array = new Array(); // the permanent indices, that can't be changed
		public function puzzle() 
		{
			
			trace("Allocating the board");
			
			board = new Array( );
			for (var i = 0 ; i < 81; ++i )
			board.push(new square(0));
		
			
			
		}
		
		
		
	}

}