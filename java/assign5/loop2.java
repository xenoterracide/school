/**************************************************************
 * *** Date: Sat Nov  8 13:21:12 EST 2008
 * *** Name: Caleb Cushing
 * *** Purpose: count down from 30 to zero, printing each number, except 27 
 * until the program reaches 5
 * **************************************************************/
public class loop2
{
	public static void main(String[] args)
	{
		int i = 30;
		while (i != 0) {
			i--;
			if (i != 27) {
				System.out.println(i);
				if (i == 5) {
					break;
				}
			}
		}
	}
}
