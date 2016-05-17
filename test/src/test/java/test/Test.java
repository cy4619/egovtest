package test;

import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class Test {

	@org.junit.Test
	public void test() {
		//fail("Not yet implemented");
		
/*		Tree<Integer, String> tree = new Tree<>(1, "Bob");

		tree.addChild(1, 2, "John");
		tree.addChild(1, 3, "James");
		tree.addChild(2, 4, "David");
		tree.addChild(2, 5, "Alice");

		System.out.println(tree.subtreeToString(1));
		System.out.println(tree.subtreeToString(3));
		*/
		
		
	    Page root = new Page();

	    Page b    = new Page("b"  , 2, root);
	    Page b1   = new Page("b.1", 1, b);
	    Page b3   = new Page("b.3", 3, b);
	    Page b2   = new Page("b.2", 2, b);

	    Page a    = new Page("a"  , 1, root);
	    Page a2   = new Page("a.2", 2, a);
	    Page a1   = new Page("a.1", 1, a);

	    List<Page> pages = Arrays.asList(root, a, a1, a2, b, b1, b2, b3);
	    System.out.println(pages);

	    Collections.shuffle(pages);
	    System.out.println(pages);

	    Collections.sort(pages);
	    System.out.println(pages);		
	}
	
	

}
