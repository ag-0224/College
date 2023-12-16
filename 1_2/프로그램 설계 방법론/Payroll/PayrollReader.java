package payroll;

import java.io.*;
import java.util.*;

public class PayrollReader {
	
	private BufferedReader infile; 
	private String name;
	private int hours, payrate;
	
	public PayrollReader(String file_name) throws IOException {
		infile = new BufferedReader(new FileReader(file_name));
	}
	
	public String nameOf() { return name; }
	public int hoursOf() { return hours; }
	public int payrateOf() { return payrate; }
	public void close() throws IOException { infile.close(); }
	
	public boolean getNextRecord() throws IOException {
		boolean result = false;
		if (infile.ready()) {
			String line = infile.readLine();
			StringTokenizer t = new StringTokenizer(line, ",");
			String s = t.nextToken();
			if (! s.equals("!")) {
				name = s;
				hours = Integer.parseInt(t.nextToken());
				payrate = Integer.parseInt(t.nextToken());
				result = true;
			}
		}
		return result;
	}
	
}
