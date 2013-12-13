package 
{
	import asunit.framework.Assert;
	import asunit.textui.TestRunner;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import asunit.framework.TestCase;
	import flash.events.MouseEvent;
	import AsUnit;
	/**
	 * ...
	 * @author Arpan
	 */
	public class Main extends Sprite 
	{
		
		
		public function Main():void 
		{


			if (stage)
			{
				//var unittests:TestRunner = new TestRunner();
				//stage.addChild(unittests);
				//unittests.start(AddTests, null, TestRunner.SHOW_TRACE);
				
				var p1:player = new player();
				p1.start();
				
		 		init();
			
				
				
			}
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			//var puzzle:Puzzle = new Puzzle();
			//simulating user's choosing of a type of a game
			//assertTrue(puzzle.chooseEasyPuzzle());
			//assertTrue(puzzle.chooseMediumPuzzle());
			//assertTrue(puzzle.chooseHardPuzzle());
			//Assert.assertTrue(willPass);
			//checking for validity of the puzzle
			//assertTrue(puzzle.isPuzzleValid());
			
			
			
			
			
			
			
			
			
		}
	
	}
	
}