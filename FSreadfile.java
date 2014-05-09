package external_tools;

import java.io.*;

public class FSreadfile {

    private String f;
    private RandomAccessFile file;
    private long directoryBlockPos = 4096;

    public void start(String f, String filename) {
	try {
	    file = new RandomAccessFile(filename,"rw");
	    int blockNum = getBlockNum(f);
	    readFile(blockNum);
	}
	catch ( IOException e ) {
	    System.out.print("IO Exception - BlockDevice file not found.");
	}
    }

    private int getBlockNum(String f) throws IOException {
	//A byte equal to null is 0x00000000
	long currPos = directoryBlockPos;
	while ( currPos <= 8191 ) {
	    file.seek(currPos);
	    byte[] bytes = new byte[12];
	    char[] chars = new char[12];
	    int c = 0;
	    while ( c < 12 ) {
		bytes[c] = (byte)file.read();
		chars[c] = (char)bytes[c];
		if ( (int)chars[c] == 0 ) {
		    break;
		}
		c++;
	    }
	    String s = "";
	    c = 0;
	    while ( c < 12 ) {
		if ( (int)chars[c] == 0 ) {
		    break;
		}
		s += chars[c];
		c++;
	    }
	    if ( s.equals(f) ) {
		currPos += 12;
		file.seek(currPos);
		int block = file.readInt();
		if ( block == 0 ) {
		    throw new RuntimeException("File was deleted.");
		}
		return block;
	    }
	    currPos += 16;       	    
	}
	
	if ( currPos > 8191 ) {
	    throw new RuntimeException("File not found.");
	}
	
	return 0;
    }

    private void readFile(int blockNum) throws IOException {
	//Iterate to inode
	long inodePos = 8192;
	int c = blockNum;
	while ( c > 2 ) {
	    inodePos += 4096;
	    c--;
	}

	file.seek(inodePos);

	//Read immediate data
	c = 0;
	while ( c < 2044 ) {
	    System.out.print(""+(char)file.readByte());
	    c++;
	}

	//Loop through direct indices, printing out 4096 chars at a time
	inodePos += 2048;
	while ( true ) {
	    file.seek(inodePos);
	    long pos = 8192;
	    c = file.readInt();
	    if ( c == 0 ) {
		break;
	    }
	    inodePos += 4;
	    while ( c > 2 ) {
		pos += 4096;
		c--;
	    }
	    
	    file.seek(pos);

	    c = 0;
	    while ( c < 4096 ) {
		System.out.print(""+(char)file.readByte());
		c++;
	    }
	}
    }

}
