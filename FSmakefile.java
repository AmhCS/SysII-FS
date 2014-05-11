package external_tools;

import java.io.*;

public class FSmakefile {

    private String newFile;
    private RandomAccessFile file;
    private long directoryBlockPos = 4096;
    private long freePosition = 12;

    public void start(String newFile, String filename) {
	try {
	    file = new RandomAccessFile(filename,"rw");
	    if( fileExists(newFile) ) {
		System.out.println("File " + newFile + " already exists.");
	    }
	    else {
		makeFile(newFile);
	    }
	}
	catch ( IOException e ) {
	    System.out.print("IO Exception - BlockDevice file not found.");
	}
    }

    private boolean fileExists(String newFile) throws IOException {
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
	    if ( s.equals(newFile) ) {
		return true;
	    }
	    currPos += 16;       	    
	}

	return false;
    }

    private long firstFreeEntry() throws IOException {
	//A byte equal to null is 0x00000000
	long currPos = directoryBlockPos;
	while ( currPos <= 8191 ) {
	    file.seek(currPos);
	    byte b = (byte)file.read();
	    
	    if ( b == 0 ) {
		break;
	    }
	    currPos += 16;
		 
	}
	
	if ( currPos >= 8191 ) {
	    throw new RuntimeException("Directory block full.");
	}

	return currPos;
    }

    private int getFreeBlock() throws IOException {
	file.seek(freePosition);
	return file.readInt();
    }

    private void incrementFreeBlock() throws IOException {
	file.seek(freePosition);
	int free = file.readInt();
	free++;
	file.seek(freePosition);
	file.writeInt(free);
    }

    private void makeFile(String newFile) throws IOException {
	long currPos = firstFreeEntry();
	int freeBlock = getFreeBlock();
	incrementFreeBlock();
	char[] chars = newFile.toCharArray();
	byte[] bytes = new byte[chars.length];
	int c = 0;
	for ( byte b : bytes ) {
	    bytes[c] = (byte)chars[c];
	    c++;
	}

	//Write new entry as 16 bytes in the directory block
	file.seek(currPos);
	file.write(bytes);

	currPos += 12;
	file.seek(currPos);
	file.writeInt(freeBlock);

	//Seek to the first free block, where you will write the inode for the file
	long inodePos = 8192;
	c = freeBlock;
	while ( c > 2 ) {
	    inodePos += 4096;
	    c--;
	}

	file.seek(inodePos);

	//Create inode
	RandomAccessFile input = new RandomAccessFile(newFile,"r");
	int byteLength = (int)input.length();
	file.writeInt(byteLength);
	currPos = inodePos + 4;
        byte[] nfb = new byte[byteLength];
	byte b;

	//Read and write the immediate data
	c = 0;
	while ( c < byteLength ) {
	    nfb[c] = (byte)input.read();
	    c++;
	}
       
	file.seek(currPos);
	
	int nfbCounter = 0;
	
	for ( c = 0; c < byteLength; c++ ) {
	    file.writeByte((int)nfb[c]);
	    nfbCounter++;
	    if ( c > 2044 ) {
		break;
	    }
	}
	
	currPos += 2044;

	//Write the direct indeces
	if ( byteLength <= 2044 ) {
	    return;
	}
	
	while ( nfbCounter < nfb.length - 1 ) {
	    freeBlock = getFreeBlock();
	    incrementFreeBlock();
	    file.seek(currPos);
	    file.writeInt(freeBlock);
	    currPos += 4;

	    //Iterate to block
	    c = freeBlock;
	    int indicePos = 8192;
	    while ( c > 2 ) {
		indicePos += 4096;
		c--;
	    }

	    //Write 4096 bytes to block
	    file.seek(indicePos);
	    c = 0;
	    while ( c < 4096 ) {
		if ( nfbCounter > nfb.length - 1 ) {
		    break;
		}
		file.writeByte((int)nfb[nfbCounter]);
		c++;
		nfbCounter++;
	    }
	}
	
    }

}
