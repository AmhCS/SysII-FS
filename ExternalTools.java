package external_tools;

public class ExternalTools {

    public static void main(String Args[]) {

	String filename = "block-device.data";

	if ( Args.length == 0 ) {
	    System.out.println("Incorrect usage.");
	    System.out.println("Usage: ExternalTools <mode> <file>");
	    System.out.println("Mode is 0 for format, 1 for makefile and 2 for readfile");
	    System.out.println("File is only supplied for modes 1 and 2, indicating the file to be made or read, respectively.");
	}
	else if ( Args[0].equals("0") ) {
	    new FSformat().start(filename);
	}
	else if ( Args[0].equals("1") && Args.length == 2 ) {
	    new FSmakefile().start(Args[1],filename);
	}
	else if ( Args[0].equals("2") && Args.length == 2 ) {
	    new FSreadfile().start(Args[1],filename);
	}
	else {
	    System.out.println("Invalid argument(s).");
	}
    }

}