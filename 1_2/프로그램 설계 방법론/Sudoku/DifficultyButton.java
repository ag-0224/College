package sudoku;

import java.awt.event.*;
import javax.swing.*;

/** DifficultyButton - 난이도 버튼을 생성함
 * @author 권용욱, 조 은  */
public class DifficultyButton  extends JButton implements ActionListener {

	private String message; // 버튼 이름을 필드 변수로 저장
	
	/** Constructor - 버튼 설치
	 * @param s - String 인자 s를 버튼 이름으로 받아옴  */
	public DifficultyButton(String s) {
		super(s);
		message = s; // 버튼 이름을 필드 변수에다 저장
		addActionListener(this);
	}
	
	/** actionPerformed - 사용자가 클릭한 버튼의 이름에 따라 스도쿠 게임의 구멍 개수를 정하고, 게임을 시작함 */
	public void actionPerformed(ActionEvent e) {
		if (message.equals("Easy")) {
			Sudoku s = new Sudoku(new SudokuBoard(), 5); // Easy : 구멍 개수 5개
			new SudokuFrame(s); // 스도쿠 판 생성함
		}
		else if (message.equals("Normal")) {
			Sudoku s = new Sudoku(new SudokuBoard(), 10); // Normal : 구멍 개수 10개
			new SudokuFrame(s); // 스도쿠 판 생성함
		}
		else if (message.equals("Hard")) {
			Sudoku s = new Sudoku(new SudokuBoard(), 15); // Hard : 구멍 개수 15개
			new SudokuFrame(s); // 스도쿠 판 생성함
		}
	}
	
}
