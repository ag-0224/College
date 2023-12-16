package sudoku;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

/** SudokuButton - 스도쿠 보드의 버튼을 생성
 * @author 권용욱, 조 은 */
public class SudokuButton extends JButton implements ActionListener {

	private Sudoku sudoku; // sudoku를 필드 변수에 저장함
	private SudokuFrame view; // SudokuFrame을 필드 변수에 저장함 - view 역할
	private int row; // 버튼의 행 위치를 필드 변수에 저장함
	private int col; // 버튼의 열 위치를 필드 변수에 저장함
	
	/** Constructor - SudokuButton을 생성
	 * @param s - Sudoku를 인자로 받아 필드 변수에 저장
	 * @param v - SudokuFrame을 인자로 받아 필드 변수에 저장
	 * @param r - 버튼의 행 위치를 인자로 받아 필드 변수에 저장
	 * @param c - 버튼의 열 위치를 인자로 받아 필드 변수에 저장 */
	public SudokuButton(Sudoku s, SudokuFrame v, int r, int c) {
		sudoku = s;
		view = v;
		row = r;
		col = c;
		addActionListener(this);
	}
	
	/** next - 사용자로 부터 받은 스도쿠의 답을 확인한 후, 정답이면 보드를 업데이트함
	 * @param f - 사용자로 부터 받은 답
	 * @return 사용자로 부터 받은 답이 정답일 경우 true, 그렇지 않으면 false를 리턴함 */
	public boolean next(int f) {
		if (sudoku.play(row, col, f)) {
			view.update();
			return true;
		}
		else
			return false;
	}
	
	/** actionPerformed - 사용자가 스도쿠 버튼이 비어있는 버튼을 누르면 KeyPad를 생성해줌 */
	public void actionPerformed(ActionEvent e) {
		String s = getText();
		// 스도쿠 버튼이 비어있을 경우에 KeyPad를 생성
		if (s.equals("")) {
			new KeyPad(this);
		}
	}
	
}
