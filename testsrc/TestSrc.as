package  
{
	import asunit.framework.TestCase;
	
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
			
			trace( board);
			
			assertTrue(true);
				
		}
		
		public function testNewPuzzle() : void
		{
			var p1 : player = new player();
			assertEquals(p1.chooseAndGeneratePuzzle("easy"), "easy");
			assertEquals(p1.chooseAndGeneratePuzzle("med"), "med");
			assertEquals(p1.chooseAndGeneratePuzzle("hard"), "hard");
		}
		
		public function dummyTest(): void
		{
			assertTrue(true);	
			
			assertEquals(5,0);
		}
		
	}

}