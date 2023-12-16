package payroll;

import java.io.*;
import javax.swing.*;

public class Payroll {

	public static void main(String[] args) throws IOException {
		String name_in = JOptionPane.showInputDialog("입력파일명");
		String name_out = JOptionPane.showInputDialog("출력파일명");
		PayrollReader reader = new PayrollReader(name_in);
		PayrollWriter writer = new PayrollWriter(name_out);
		while (reader.getNextRecord()) {
			int payment = reader.hoursOf() * reader.payrateOf();
			writer.printCheck(reader.nameOf(), payment);
		}
		writer.printCheck("!");
		reader.close();
		writer.close();
	}
}
