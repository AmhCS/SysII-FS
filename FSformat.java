package external_tools;

import java.io.*;

public class FSformat {

    private RandomAccessFile file;
    private int magic = 0x1234ABCD;
    private long magicPosition = 0;
    private long currPositon = 0;
    private int directoryBlock = 1;
    private long directoryPosition = 8;
    private int firstFreeBlock = 2;
    private long freePosition = 12;
    
    public void start(String filename) {
	try {
	    file = new RandomAccessFile(filename,"rw");
	    if ( testFormated() ) {
		System.out.println("Already formated.");
	    }
	    else {
		format();
	    }
	}
	catch ( IOException e ) {
	    System.out.print("IO Exception - BlockDevice file not found.");
	}
    }

   private boolean testFormated() throws IOException {
        file.seek(magicPosition);
	int key = file.readInt(); //read and writes advances file pos pointer

	if ( key == magic ) {
	    return true;
	}
	else {
	    return false;
	}
    }

    private void format() throws IOException {
	//Write magic number as the first 32bit word on the super block
	file.seek(magicPosition);
	file.writeInt(magic);

	//Set directory block number as third 32bit word
	file.seek(directoryPosition);
	file.writeInt(directoryBlock);

	//Set block number of start of free block chain as fourth 32bit word, which is after the directory block number in the super block
	file.writeInt(firstFreeBlock);

	
    }
    
}