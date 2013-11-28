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
		
		public function dummyTest(): void
		{
			assertTrue(true);	
			
			assertEquals(5,0);
		}
		
	}

}