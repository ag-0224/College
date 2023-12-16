package payroll;

import java.io.*;

public class PayrollWriter {
	
	private PrintWriter outfile;
	
	public PayrollWriter(String file_name) throws IOException {
		outfile = new PrintWriter(new FileWriter(file_name));
	}
	
	public void close() { outfile.close(); }
	
	public void printCheck(String name, int payment) {
		outfile.println(name + "," + payment);
	}
	
	public void printCheck(String s) {
		outfile.println(s);
	}
}
