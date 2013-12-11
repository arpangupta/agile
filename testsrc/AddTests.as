package  
{
	import asunit.framework.TestSuite;
	
	/**
	 * ...
	 * @author Arpan
	 */
	public class AddTests extends TestSuite 
	{
		
		public function AddTests() 
		{
			super();
			addTest(new TestSrc("isPuzzleValid"));
			addTest(new TestSrc("testNewPuzzle"));
			//addTest(new TestSrc("checkSetSquare"));
			addTest(new TestSrc("checkSetOriginalSquare"));
			addTest(new TestSrc("checkDuplicateNumber"));
			addTest(new TestSrc("testGameWin"));
			addTest(new TestSrc("testSetSquareAfterGameWon"));
		
		}
		
	}

}