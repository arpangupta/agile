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
			
			addTest(new TestSrc("dummyTest"));
		}
		
	}

}