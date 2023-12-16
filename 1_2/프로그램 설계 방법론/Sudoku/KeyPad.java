package sudoku;

import java.awt.*;
import javax.swing.*;

/** KeyPad - 키패드를 생성함
 * @author 권용욱, 조은*/
public class KeyPad extends JFrame {
	
	private int size = 3; // 행과 열의 길이를 3으로 설정
	private int button_size = 100; // 버튼의 사이즈는 100으로 설정
	private KeyPadButton[][] button; // KeyPadButton 배열 생성
	
	/** Constructor - KeyPad - KeyPad 창을 생성함
	 * @param r - SudokuButton을 받아  KeyPadButton에 넣음*/
	public KeyPad(SudokuButton r) {
		button = new KeyPadButton[size][size];
		Container cp = getContentPane();
		cp.setLayout(new GridLayout(size, size));
		int number = 1;
		// KeyPadButton 배열에 KeyPadButton 객체를 끼워 넣음
		for (int i = 0; i < size; i++)
			for (int j = 0; j < size; j++) {
				button[i][j] = new KeyPadButton(r, this, number);
				cp.add(button[i][j]);
				button[i][j].setBackground(Color.white);
				button[i][j].setText("" + number);
				// 글자의 폰트는 "맑은 고딕", 글씨의 효과는 PLAIN, 글씨의 크기는 30으로 설정함
				button[i][j].setFont(new Font("맑은 고딕", Font.PLAIN, 30));
				number++;
			}
		setTitle("KeyPad");
		setSize(size * button_size + 10, size * button_size + 10);
		setResizable(false);
		setLocationRelativeTo(null);
		setVisible(true);
	}
	
}
