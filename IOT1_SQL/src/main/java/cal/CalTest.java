package cal;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class CalTest {
	Cal c;

	@Before
	public void numSetUpBefore() throws Exception {
		System.out.println(c);
		c = new Cal();
		System.out.println(c);
	}

	@Test
	public void testNumPlus() {
		int result = c.numPlus(10, 20);
		assertEquals("20+10=30", 30, result);
	}

	@Test
	public void testNumMinus() {
		int result = c.numMinus(20, 10);
		assertEquals("20-10=10", 10, result);
	}

	@Test
	public void testNumDivide() {
		int result = c.numMultiple(10, 20);
		assertEquals("10*20=200", 200, result);
	}

	@Test
	public void testNumMultiple() {
		int result = c.numDivision(20, 10);
		assertEquals("20/10=2", 2, result);
	}

	@After
	public void numSetUpAfter() throws Exception {
		System.out.println(c);
		c = null;
	}
}
