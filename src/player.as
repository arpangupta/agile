package  
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.globalization.Collator;
	import flash.system.System;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
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
		
		[Embed(source="../lib/board_.png")]
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
		
		[Embed(source = "../lib/blank.png")]
		private var blankClass:Class;
		
		[Embed(source = "../lib/blankListener.png")]
		private var blankListener:Class;
		private var blankListenerImage:Sprite = new Sprite();
		
		[Embed(source = "../lib/goBack.png")]
		private var backClass:Class;
		private var backImage:Sprite = new Sprite();
		private var backImageBit:Bitmap = new backClass();
		
		[Embed(source = "../lib/Solution.png")]
		private var solutionClass:Class;
		private var solutionImage:Sprite;
		
		public  var x_coord:int = 0;
		public  var y_coord:int = 0;
		
		public  var offset1:int = 52;
		public  var offset2:int = 50;
		private var ArrayOfBitmapClasses:Array;
		private var ArrayOfBitmapClassesPerm:Array;
		private var ArrayOfArrays:Array;
		public var allSprite:Array = new Array();
		private var lastSelected:Array = new Array(null, null);
		private var boardSpriteArray:Array = new Array();
		private var boardClassArray:Array = new Array();
		
		private var info:TextField = new TextField();
		private var tf:TextFormat;
		
		public function player() 
		{
			//the constructor
			
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
			
			ArrayOfArrays.push(blankClass);
			
			info = new TextField();
			info.text = "SUDOKU";
			info.y = 460;
			info.x = 165;
			tf = new TextFormat();
			tf.size = 30;
			tf.color = 0x00FF00;
			info.setTextFormat(tf);
 			
			
			
			//allSprite = new Array( null, null );
			
			for (var i:int = 0 ; i < 81; ++i )
			{
				boardClassArray.push(new blankClass());
				boardSpriteArray.push(new Sprite());
				
				boardSpriteArray[i].addChild(boardClassArray[i]);
			}
			
			
			blankListenerImage.addChild(new blankListener());
			//blankListenerImage.doubleClickEnabled = true;
			this.addEventListener(MouseEvent.CLICK, setSelectedAndChange);
			blankListenerImage.x = 0;
			blankListenerImage.y = 0;
			//donot add it
		}
		
		public function start():void
		{
			//the start page of the game
			welcomeImage = new Sprite();
			welcomeImage.addChild(new welcomeClass());
			welcomeImage.x = 0;
			welcomeImage.y = 0;
			welcomeImage.addEventListener(MouseEvent.CLICK, this.onclick );
			this.addChild(welcomeImage);
		}
		
		
		
		public function onclick(e:MouseEvent):void 
		{
			//handling the mouse click on the start page 
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
				this.addChild(info);
				backImage.addChild(backImageBit);
				backImage.x = 300;
				backImage.y = 450;
				
				solutionImage = new Sprite();
				solutionImage.addChild(new solutionClass());
				solutionImage.x = 0;
				solutionImage.y = 450;
				//backImage.addEventListener(MouseEvent.CLICK, this.goback);
			
				
				this.addChild(backImage);
				this.addChild(solutionImage);
				this.addChild(blankListenerImage);
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
				
				this.addChild(info);
				
				backImage.addChild(backImageBit);
				backImage.x = 300;
				backImage.y = 450;
				//backImage.addEventListener(MouseEvent.CLICK, this.goback);
				this.addChild(backImage);
				solutionImage = new Sprite();
				solutionImage.addChild(new solutionClass());
				solutionImage.x = 0;
				solutionImage.y = 450;
				this.addChild(solutionImage);
				
				this.addChild(blankListenerImage);
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
				this.addChild(info);
				
				backImage.addChild(backImageBit);
				backImage.x = 300;
				backImage.y = 450;
				//backImage.addEventListener(MouseEvent.CLICK, this.goback);
				this.addChild(backImage);
				solutionImage = new Sprite();
				solutionImage.addChild(new solutionClass());
				solutionImage.x = 0;
				solutionImage.y = 450;
				this.addChild(solutionImage);
				
				this.addChild(blankListenerImage);
			}
			
			if (x > 62 && x < 62 + 324 && y > 401 && y < 401 + 47   )
			{
				trace("Exit");
				System.exit(0);
			}
			
		}
		
		public function goback() :void
		{
			//go back to the start screen of the game
			endGame();
			this.removeChild(blankListenerImage);
			this.removeChild(boardImage);
			this.start();
		}
		
		public function displaySolution():void
		{
			//display the solution for the game
			var i:int;
			for ( i = 0; i < 81; ++i)
				if ( sudokuPuzzle.player_board[i].getValue() == 0 || (sudokuPuzzle.board[i].getValue() != sudokuPuzzle.player_board[i].getValue()))
					this.draw_cell(i % 9, Math.floor(i/9), 0, sudokuPuzzle.board[i].getValue() -1 ); 
			
			winStatus = true;	
		}
		
		public function setSelectedAndChange(e:MouseEvent) :void
		{
			//select a square and either change it or set it to blank
			var x:int = e.localX;
			var y:int = e.localY;
			
			
			
			var row:int = y / 50;
			var col:int = x / 50;
			if (x > 300 && y> 450 && y <= 500)
			{
				this.goback();
			}
			
			else if (x > 0 && x < 150 && y > 450 && y <= 500 )
				this.displaySolution();
			
			else if (row == 10)
			{
				//change it
			
				if ( lastSelected[0] != null )
				{
					//trace("col : " + col);
					var re:String = setSquare(lastSelected[1], lastSelected[0], col + 1);
					
					
					if (re == "Done" )
					{
						this.draw_cell( lastSelected[0], lastSelected[1], 1, col);
						//trace("CHANGED : " + lastSelected[0] +"," + lastSelected[1] + " To: " +  ( col + 1) );
						this.info.text = "CHANGED!";
						
					}	
					else if(re == "Won")
					{
						this.draw_cell( lastSelected[0], lastSelected[1], 1, col);
						//trace("CHANGED : " + lastSelected[0] +"," + lastSelected[1] + " To: " +  ( col + 1) );
						this.info.text = "YOU WIN!";
					}
					
					else if(re == "Game Over")
					{
						
						this.info.text = "GAME OVER";
					}
					
					else if (re == "Duplicate")
					{
						this.info.text = "DUPLICATE!";
					}
					
					else if (re == "Illegal Operation")
					{
						this.info.text = "Not Allowed!"
					}
					
					tf = new TextFormat();
					tf.size = 15;
					tf.color = 0xFF0000;
					this.info.setTextFormat(tf);
					this.addChild(info);
					this.addChild(blankListenerImage);
				}
			}
			
			else if (row == 9 && (col == 3 || col == 4 || col == 5 ))
			{
				//make it blank
				if ( lastSelected[0] != null )
				{
					trace("col : " + col);
					re = setSquare(lastSelected[1], lastSelected[0], 0);
					//trace("Seeting it blank");
					
					if ( re == "Done")
					{
						this.draw_cell( lastSelected[0], lastSelected[1], 2, 0);
					//	trace("CHANGED : " + lastSelected[0] +"," + lastSelected[1] + " To: " +  ( col + 1) );
						this.info.text = "Blank: " + sudokuPuzzle.player_board[lastSelected[1]*9 + lastSelected[0]].getValue();
						tf = new TextFormat();
						tf.size = 15;
						tf.color = 0xFF0000;
						this.info.setTextFormat(tf);
						this.addChild(info);
						this.addChild(blankListenerImage);
					}
				}
			}
			
			else
			{
				//select a square
				//trace("SELCTED: " + col + ","+ row);
				lastSelected[0] = col;
				lastSelected[1] = row;
				
				this.info.text = "";
				this.addChild(info);
				this.addChild(blankListenerImage);
			}
		}
		
		public function display_first():void
		{
			// the first diplay of board and the permanent squares
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
					this.draw_cell(i % 9, Math.floor(i/9), 2, 0 );
				}
			}
		}
		
		public function draw_cell(x:int, y:int, index1:int, index2:int ): void
		{
			//helper function to draw the cells on board
			var tempClass:Class ;
			if (index1 < 2)
			{
			//	var cell:Sprite = new Sprite();
				tempClass = ArrayOfArrays[index1][index2];
				//cell.addChild(new tempClass());
			}
			
			else
			{
				tempClass = ArrayOfArrays[index1];
			}
			
			//cell.x = x_coord + ((x > 0)? (offset1 + (x - 1) * offset2) : (0)  );
			//cell.y = y_coord + ((y > 0)? (offset1 + (y - 1) * offset2) : (0)  ); 
			//allSprite.push(cell);
			if (boardSpriteArray[9 * y + x] == null)
			{
				boardSpriteArray[9 * y + x] = new Sprite();
			}
		
			
			boardSpriteArray[9 * y + x].removeChild(boardClassArray[9 * y + x]);
			boardClassArray[9 * y + x] = new tempClass();
			

			
			
			boardSpriteArray[9 * y + x].addChild(boardClassArray[9 * y + x]);
			boardSpriteArray[9 * y + x].x = x_coord + ((x > 0)? (offset1 + (x - 1) * offset2) : (0)  );
			boardSpriteArray[9 * y + x].y = y_coord + ((y > 0)? (offset1 + (y - 1) * offset2) : (0)  ); 
			
			this.addChild(boardSpriteArray[9 * y + x]);
			this.addChild(blankListenerImage);
			
		}
		
		public function chooseAndGeneratePuzzle(type:String) : puzzle
		{
			//function to generate the specified puzzle
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
			//to end the game
			sudokuPuzzle.board = new Array();
			sudokuPuzzle.perm_ind = new Array();
			sudokuPuzzle.player_board = new Array();
			winStatus = false;
		}
		
		public function setSquare(i : int , j : int, value : int) : String
		{
			//to handle the logic for setting a square in te player_board
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
				
				//trace("Player Board Array : " + player_board_array);
				
				if(!is_possible_number(index, value, player_board_array))
				{ 
					//trace("Duplicate");
					return "Duplicate";
				}
				
				else
				{
					
					sudokuPuzzle.player_board[index].value = value;
					//trace("CHANGED THE VALUE");
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
			//check for the winning condition
			for (var i : int = 0; i < 81; ++i )
			{
				if(sudokuPuzzle.player_board[i].getValue() == 0)
					return false;
			}
			
			return true;
		}
		public function areEqual(board1:Array, board2 : Array):Boolean
		{
			//helper function to check if 2 arrays are equal
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
		
		public function is_possible_row(number : int, row :int, sudoku : Array):Boolean {
			//check if putting a number is allowed in the row
            var possible:Boolean = true;
            for (var i:int=0; i<=8; i++) {
                if (sudoku[row*9+i] == number) {
                    possible = false;
                    break;
                }
            }
            return possible;
        }
        public function is_possible_col(number:int, col:int, sudoku:Array): Boolean {
			//check if the putting the number is allowed in the column
            var possible:Boolean = true;
            for (var i:int=0; i<=8; i++) {
                if (sudoku[col+9*i] == number) {
                    possible = false;
                    break;
                }
            }
            return possible;
        }
        public function is_possible_block(number:int, block:int, sudoku:Array):Boolean {
			//check if the putting the number is allowed in the block
			
            var possible:Boolean = true;
            for (var i:int =0; i<=8; i++) {
                if (sudoku[Math.floor(block/3)*27+i%3+9*Math.floor(i/3)+3*(block%3)] == number) {
                    possible = false;
                    break;
                }
            }
            return possible;
        }
        public function is_possible_number(cell:int, number:int, sudoku:Array) : Boolean {
			//check if the putting the number is allowed
            var row:int = return_row(cell);
            var col:int = return_col(cell);
            var block:int = return_block(cell);
			if (number == 0) 
				return true; 
			
			return is_possible_row(number,row,sudoku) && is_possible_col(number,col,sudoku) && is_possible_block(number,block,sudoku);
        }
		
		public function return_row(cell : int) :int {
			//helper function
            return Math.floor(cell / 9);
        }
		
		public function return_col(cell : int) : int {
			//helper function
            return cell % 9;
        }
		
		public function return_block(cell:int ): int {
			//helper function
            return Math.floor(return_row(cell) / 3) * 3 + Math.floor(return_col(cell) / 3);
        }
	}

}