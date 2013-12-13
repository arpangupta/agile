package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.globalization.Collator;
	import flash.system.System;
	/**
	 * ...
	 * @author Arpan
	 */
	public class player extends Sprite
	{
		public var sudokuPuzzle:puzzle; // will have the player's as well as the solution board
		public var winStatus:Boolean = false;
		[Embed(source = "../lib/welcomePage.png")]
		private var welcomeClass:Class;

		public var welcomeImage:Sprite;
		
		[Embed(source="../lib/board.png")]
		private var boardClass:Class;
		
		public var boardImage:Sprite;
		
		
		[Embed(source = "../lib/1.png")]
		private var oneClass:Class;
		
		[Embed(source = "../lib/1_perm.png")]
		private var onePermClass:Class;
		
		[Embed(source = "../lib/2.png")]
		private var twoClass:Class;
		
		[Embed(source = "../lib/2_perm.png")]
		private var twoPermClass:Class;
		
		[Embed(source = "../lib/3.png")]
		private var threeClass:Class;
		
		[Embed(source = "../lib/3_perm.png")]
		private var threePermClass:Class;
		
		[Embed(source = "../lib/4.png")]
		private var fourClass:Class;
		
		[Embed(source = "../lib/4_perm.png")]
		private var fourPermClass:Class;
		
		[Embed(source = "../lib/5.png")]
		private var fiveClass:Class;
		
		[Embed(source = "../lib/5_perm.png")]
		private var fivePermClass:Class;
		
		[Embed(source = "../lib/6.png")]
		private var sixClass:Class;
		
		[Embed(source="../lib/6_perm.png")]
		private var sixPermClass:Class;
		
		[Embed(source = "../lib/7.png")]
		private var sevenClass:Class;
		
		[Embed(source = "../lib/7_perm.png")]
		private var sevenPermClass:Class;
		
		[Embed(source = "../lib/8.png")]
		private var eightClass:Class;
		
		[Embed(source = "../lib/8_perm.png")]
		private var eightPermClass:Class;
		
		[Embed(source = "../lib/9.png")]
		private var nineClass:Class;
		
		[Embed(source = "../lib/9_perm.png")]
		private var ninePermClass:Class;
		
		public  var x_coord:int = 0;
		public  var y_coord:int = 0;
		
		public  var offset1:int = 52;
		public  var offset2:int = 50;
		private var ArrayOfBitmapClasses:Array;
		private var ArrayOfBitmapClassesPerm:Array;
		private var ArrayOfArrays:Array;
		public var allSprite:Array = new Array();
		private var lastSelected:Array = new Array();
		private var 
		
		public function player() 
		{
			ArrayOfBitmapClasses = new Array();
			ArrayOfBitmapClasses.push(oneClass);
			ArrayOfBitmapClasses.push(twoClass);
			ArrayOfBitmapClasses.push(threeClass);
			ArrayOfBitmapClasses.push(fourClass);
			ArrayOfBitmapClasses.push(fiveClass);
			ArrayOfBitmapClasses.push(sixClass);
			ArrayOfBitmapClasses.push(sevenClass);
			ArrayOfBitmapClasses.push(eightClass);
			ArrayOfBitmapClasses.push(nineClass);
			
			ArrayOfBitmapClassesPerm = new Array();
			ArrayOfBitmapClassesPerm.push(onePermClass);
			ArrayOfBitmapClassesPerm.push(twoPermClass);
			ArrayOfBitmapClassesPerm.push(threePermClass);
			ArrayOfBitmapClassesPerm.push(fourPermClass);
			ArrayOfBitmapClassesPerm.push(fivePermClass);
			ArrayOfBitmapClassesPerm.push(sixPermClass);
			ArrayOfBitmapClassesPerm.push(sevenPermClass);
			ArrayOfBitmapClassesPerm.push(eightPermClass);
			ArrayOfBitmapClassesPerm.push(ninePermClass);
			
			ArrayOfArrays = new Array();
			ArrayOfArrays.push(ArrayOfBitmapClassesPerm);
			ArrayOfArrays.push(ArrayOfBitmapClasses);
			
			allSprite = new Array( null,null );
		}
		
		public function start():void
		{
			welcomeImage = new Sprite();
			welcomeImage.addChild(new welcomeClass());
			welcomeImage.x = 0;
			welcomeImage.y = 0;
			welcomeImage.addEventListener(MouseEvent.CLICK, this.onclick );
			this.addChild(welcomeImage);
		}
		
		public function onclick(e:MouseEvent):void 
		{
			var x:int = e.localX;
			var y:int = e.localY;
			
			if (x > 62 && x < 62 + 324 && y > 198 && y < 198 + 47   )
			{
				trace("Easy Puzzle Selected");
				this.chooseAndGeneratePuzzle("easy");
				this.removeChild(welcomeImage);
				boardImage = new Sprite();
				boardImage.addChild(new boardClass());
				boardImage.addEventListener(MouseEvent.CLICK, this.setSelectedAndChange);
				this.addChild(boardImage);
				display_first();
				//display();
			}
			
			if (x > 62 && x < 62 + 324 && y > 257 && y < 257 + 47   )
			{
				trace("Med Puzzle Selected");
				this.chooseAndGeneratePuzzle("med");
				this.removeChild(welcomeImage);
				boardImage = new Sprite();
				boardImage.addChild(new boardClass());
				boardImage.addEventListener(MouseEvent.CLICK, this.setSelectedAndChange);
				this.addChild(boardImage);
				display_first();
			}
			
			if (x > 62 && x < 62 + 324 && y > 331 && y < 331 + 47   )
			{
				trace("Hard Puzzle Selected");
				this.chooseAndGeneratePuzzle("hard");
				this.removeChild(welcomeImage);
				boardImage = new Sprite();
				boardImage.addChild(new boardClass());
				boardImage.addEventListener(MouseEvent.CLICK, this.setSelectedAndChange);
				this.addChild(boardImage);
				display_first();
			}
			
			if (x > 62 && x < 62 + 324 && y > 401 && y < 401 + 47   )
			{
				trace("Exit");
				System.exit(0);
			}
			
		}
		
		public function setSelectedAndChange(e:MouseEvent) :void
		{
			var x:int = e.localX;
			var y:int = e.localY;
			
			
			
			var row:int = y / 50;
			var col:int = x / 50;
			
			if (row == 10)
			{
				trace("CHANGED : " + lastSelected[0] +","+ lastSelected[1] + " To: " +  col );
				if ( lastSelected[0] != null )
				{
					if(setSquare(lastSelected[1], lastSelected[0], col) == "Done" )
						this.draw_cell( lastSelected[0], lastSelected[1], 1, col);
					//else update text field
					
				}
			}
			
			else
			{
				trace("SELCTED: " + col + ","+ row);
				lastSelected[0] = col;
				lastSelected[1] = row;
			}
		}
		
		public function display_first():void
		{
			var i:int;
			for ( i = 0; i < 81; ++i)
			{
				if ( sudokuPuzzle.perm_ind.indexOf(i) > -1)
				{
					//draw_cell takes the cell no on the board, where we have to draw the given cell 
					this.draw_cell(i % 9, Math.floor(i/9), 0, sudokuPuzzle.board[i].getValue() -1 ); 
				}
				else
				{
					
				}
			}
		}
		
		public function draw_cell(x:int, y:int, index1:int, index2:int ): void
		{
			var cell:Sprite = new Sprite();
			var tempClass:Class = ArrayOfArrays[index1][index2];
			cell.addChild(new tempClass());
			
			cell.x = x_coord + ((x > 0)? (offset1 + (x - 1) * offset2) : (0)  );
			cell.y = y_coord + ((y > 0)? (offset1 + (y - 1) * offset2) : (0)  ); 
			allSprite.push(cell);
			addChild(cell);
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
						endGame();
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