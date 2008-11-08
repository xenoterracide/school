/**************************************************************
 * *** Date: Sat Nov  8 12:43:42 EST 2008
 * *** Name: Caleb Cushing
 * *** Purpose:  count down every odd number from 40 to zero, printing each odd 
 * number down to zero, except the number 3 and 33.  
 * **************************************************************/
public class loop1
{
	public static void main(String[] args)
	{
		int i = 40;
		while ( i != 0 ) {
			i--;
			// test to make sure numbers are odd and not 33 or 3
			if ( (i % 2) == 0 || i == 33 || i == 3 ) {
				continue;
			}
			System.out.println(i);
		}
	}
}
