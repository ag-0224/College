package sudoku;

import javax.swing.*;
import java.awt.event.*;

/** KeyPadButton - 키패드 버튼을 생성함
 * @author 권용욱, 조 은 */
public class KeyPadButton extends JButton implements ActionListener {
	
	private KeyPad pad; // KeyPad를 필드 변수에 저장
	private SudokuButton request; // SudokuButton을 필드 변수에 저장
	private int number; // 버튼 자기 자신의 숫자를 필드 변수에 저장
	
	/** Constructor - KeyPad에 KeyPadButton을 설치
	 * @param r - 인자로 받은 SudokuButton을 필드 변수에 저장함
	 * @param p - 인자로 받은 KeyPad를 필드 변수에 저장함
	 * @param n - 인자로 받은 자기 자신의 숫자를 필드 변수에 저장함 */
	public KeyPadButton(SudokuButton r, KeyPad p, int n) {
		number = n;
		request = r;
		pad = p;
		addActionListener(this);
	}
	
	/** actionPerformed - 사용자가 버튼을 누르면 올바른 숫자인지 확인한 후, 맞으면 키패드를 보이지 않도록 함 */
	public void actionPerformed(ActionEvent e) {
		if (request.next(number))
			pad.setVisible(false);
	}
	
}
