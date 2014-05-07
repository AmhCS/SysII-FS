package external_tools;

import java.io.*;

public class FSreadfile {

    private String f;
    private RandomAccessFile file;

    public void start(String f, String filename) {
	try {
	    file = new RandomAccessFile(filename,"rw");
	    readFile(f);
	}
	catch ( IOException e ) {
	    System.out.print("IO Exception - BlockDevice file not found.");
	}
    }

    private void readFile(String f) {

    }

}