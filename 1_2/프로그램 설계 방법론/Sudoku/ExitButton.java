package sudoku;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

/** ExitButton - Exit 버튼을 생성함
 * @author 권용욱, 조은 */
public class ExitButton extends JButton implements ActionListener {

	/** Constructor - ExitButton 설치
	 * @param message - String 인자 message를 버튼 이름으로 설정 */
	public ExitButton(String message) {
		super(message);
		addActionListener(this);
	}

	/** actionPerformed - 사용자가 버튼을 클릭하면 프로그램을 종료함 */
	public void actionPerformed(ActionEvent e) {
		System.exit(0); // 시스템을 종료함
	}
}