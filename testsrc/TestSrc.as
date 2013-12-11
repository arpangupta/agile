package  
{
	import asunit.framework.TestCase;
	import flash.sampler.NewObjectSample;
	
	/**
	 * ...
	 * @author Arpan
	 */
	public class TestSrc extends TestCase 
	{
		
		public function TestSrc(testMethod:String=null) 
		{
			super(testMethod);	
		}
		
		public function isPuzzleValid():void
		{
			//Testing for a valid puzzle generation
			
			var generator:puzzleGenerator = new puzzleGenerator();
			var board = generator.generateBoard();
			//converting this to an array for easier processing
			var board_array = new Array();
			for (var i:int = 0; i < 81; ++i)
			{
				board_array.push(board[i].getValue());
			}
			trace( board_array );
			
			assertTrue(is_Valid(board_array));
				
		}
		function is_Valid(sudoku) {
            for (var i=0; i<=8; i++) {
                if (!is_correct_block(i,sudoku) || !is_correct_row(i,sudoku) || !is_correct_col(i,sudoku)) {
                    return false;
                }
            }
            return true;
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
		
		public function testNewPuzzle() : void
		{
			//The player chooses a new easy, hard or medium puzzle
			var p1 : player = new player();	
			
			var pzl:puzzle = p1.chooseAndGeneratePuzzle("easy"); 
			assertEquals(pzl.perm_ind.length , 50);
			assertEquals(pzl.player_board.length, 81 );
			
			pzl = p1.chooseAndGeneratePuzzle("med"); 
			assertEquals(pzl.perm_ind.length , 40);
			
			pzl = p1.chooseAndGeneratePuzzle("hard"); 
			assertEquals(pzl.perm_ind.length , 30);
			
		}
		
		public function checkSetSquare() : void
		{
			//check if user can set and reset a square
			var p1 : player = new player();
			//player selects an easy puzzle
			var pzl:puzzle = p1.chooseAndGeneratePuzzle("easy");
			//set the square to anything
			for (var i:int = 0; i < 9; ++i )
				for (var j:int = 0; j < 9; ++j )
					p1.setSquare(i, j, 8 );		
			for (var k:int = 0; k < 81; ++k )
			{
				assertEquals(p1.sudokuPuzzle.player_board[k].getValue() , 8);
			}
			//Resetting the squares
			for (var i:int = 0; i < 9; ++i )
				for (var j:int = 0; j < 9; ++j )
					p1.setSquare(i, j, 7 );	
					
			for (var k:int = 0; k < 81; ++k )
				assertEquals((pzl.player_board[i]).getValue(), 7);
				
			p1.endGame();
			
			//Testing for medium puzzle
			pzl = p1.chooseAndGeneratePuzzle("med");
			//set the square to anything
			for (var i:int = 0; i < 9; ++i )
				for (var j:int = 0; j < 9; ++j )
					p1.setSquare(i, j, 8 );		
			for (var k:int = 0; k < 81; ++k )
			{
				assertEquals((pzl.player_board[i]).getValue(), 8);
			}
			//Resetting the squares
			for (var i:int = 0; i < 9; ++i )
				for (var j:int = 0; j < 9; ++j )
					p1.setSquare(i, j, 7 );	
					
			for (var k:int = 0; k < 81; ++k )
				assertEquals((pzl.player_board[i]).getValue(), 7);
			
			p1.endGame();
			//Testing for hard puzzle
			pzl = p1.chooseAndGeneratePuzzle("hard");
			//set the square to anything
			for (var i:int = 0; i < 9; ++i )
				for (var j:int = 0; j < 9; ++j )
					p1.setSquare(i, j, 8);		
			for (var k:int = 0; k < 81; ++k )
			{
				assertEquals((pzl.player_board[i]).getValue(), 8);
			}
			//Resetting the squares
			for (var i:int = 0; i < 9; ++i )
				for (var j:int = 0; j < 9; ++j )
					p1.setSquare(i, j, 7 );	
					
			for (var k:int = 0; k < 81; ++k )
				assertEquals((pzl.player_board[i]).getValue(), 7);
			
			p1.endGame();
		
		}
		
		public function checkSetOriginalSquare() : void
		{
			var p1 : player = new player();
			//player selects an easy puzzle
			var pzl:puzzle = p1.chooseAndGeneratePuzzle("easy");
			
			var original_squares:Array = p1.sudokuPuzzle.perm_ind;
			var value_at_original_sqaures_former:Array = new Array();
			
			for (var i:int = 0; i < original_squares.length; ++i  )
				value_at_original_sqaures_former.push( p1.sudokuPuzzle.player_board[original_squares[i]].getValue() );
				
			
			trace("Former values at Original Squares:  " + value_at_original_sqaures_former);
			
			trace("original squares : " + original_squares);
			for (var i:int = 0; i < original_squares.length; ++i)
			{
				assertEquals("Illegal Operation", p1.setSquare(return_row(original_squares[i]), return_col(original_squares[i]), 8 ));
			}
			
			var value_at_original_sqaures_later:Array = new Array();
			for (var i:int = 0; i < original_squares.length; ++i  )
				value_at_original_sqaures_later.push( p1.sudokuPuzzle.player_board[original_squares[i]].getValue() );
				
			
			trace("Later values at Original Squares:  " + value_at_original_sqaures_later);
			
			assertEqualsArrays(value_at_original_sqaures_former, value_at_original_sqaures_later);
			p1.endGame();
			
			
			//Testing for med puzzle
			var pzl:puzzle = p1.chooseAndGeneratePuzzle("med");
			
			var original_squares:Array = p1.sudokuPuzzle.perm_ind;
			var value_at_original_sqaures_former:Array = new Array();
			
			for (var i:int = 0; i < original_squares.length; ++i  )
				value_at_original_sqaures_former.push( p1.sudokuPuzzle.player_board[original_squares[i]].getValue() );
				
			
			trace("Former values at Original Squares:  " + value_at_original_sqaures_former);
			
			trace("original squares : " + original_squares);
			for (var i:int = 0; i < original_squares.length; ++i)
			{
				assertEquals("Illegal Operation", p1.setSquare(return_row(original_squares[i]), return_col(original_squares[i]), 8 ));
			}
			
			var value_at_original_sqaures_later:Array = new Array();
			for (var i:int = 0; i < original_squares.length; ++i  )
				value_at_original_sqaures_later.push( p1.sudokuPuzzle.player_board[original_squares[i]].getValue() );
				
			
			trace("Later values at Original Squares:  " + value_at_original_sqaures_later);
			
			assertEqualsArrays(value_at_original_sqaures_former, value_at_original_sqaures_later);
			p1.endGame();
			
			//Testing for hard puzzle
			var pzl:puzzle = p1.chooseAndGeneratePuzzle("hard");
			
			var original_squares:Array = p1.sudokuPuzzle.perm_ind;
			var value_at_original_sqaures_former:Array = new Array();
			
			for (var i:int = 0; i < original_squares.length; ++i  )
				value_at_original_sqaures_former.push( p1.sudokuPuzzle.player_board[original_squares[i]].getValue() );
				
			
			trace("Former values at Original Squares:  " + value_at_original_sqaures_former);
			
			trace("original squares : " + original_squares);
			for (var i:int = 0; i < original_squares.length; ++i)
			{
				assertEquals("Illegal Operation", p1.setSquare(return_row(original_squares[i]), return_col(original_squares[i]), 8 ));
			}
			
			var value_at_original_sqaures_later:Array = new Array();
			for (var i:int = 0; i < original_squares.length; ++i  )
				value_at_original_sqaures_later.push( p1.sudokuPuzzle.player_board[original_squares[i]].getValue() );
				
			
			trace("Later values at Original Squares:  " + value_at_original_sqaures_later);
			
			assertEqualsArrays(value_at_original_sqaures_former, value_at_original_sqaures_later);
			p1.endGame();
			
		}
		
		public function checkDuplicateNumber() : void
		{
			var p1:player = new player();
			//check for easy puzzle
			p1.chooseAndGeneratePuzzle("easy");
			//removing the perm_index constraint for the ease of testing
			p1.sudokuPuzzle.perm_ind = new Array(10); 
			//row duplicate
			assertEquals("Done", p1.setSquare(0, 0, 9));
			assertEquals("Duplicate",p1.setSquare(0, 1 , 9)); //the duplicate
			
			//column duplicate
			assertEquals("Duplicate", p1.setSquare(1, 0, 9 )); //duplicate
			
			//block duplicate
			assertEquals("Done", p1.setSquare(1, 1, 8));
			assertEquals("Done", p1.setSquare(2, 2, 9)); //duplicate
		}
		
		
		
		
		
		function return_row(cell : int) :int {
            return Math.floor(cell / 9);
        }
		
		 function return_col(cell : int) : int {
            return cell % 9;
        }
		
		public function dummyTest(): void
		{
			assertTrue(true);	
			
			assertEquals(5, 5);
			
			trace("This should be displayed on the console");
		}
		
	}

}