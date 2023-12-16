package sudoku;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

/** SudokuFrame - 스도쿠 문제를 보여주기 위해 SudokuFrame을 생성
 * @author 권용욱, 조 은 */
public class SudokuFrame extends JFrame {
	
	private Sudoku sudoku; // sudoku를 필드 변수에 저장
	private SudokuButton[][] button; // SudokuButton의 배열을 필드 변수에 저장
	private int size = 9; // 행과 열의 길이를 3으로 설정함
	private int button_size = 60; // 버튼의 크기를 60으로 설정함

	/** Constructor - SudokuFrame을 생성
	 * @param s - sudoku 인자를 받아 필드 변수에 저장함 */
	public SudokuFrame(Sudoku s) {
		sudoku = s;
		button = new SudokuButton[size][size];
		Container cp = getContentPane();
		cp.setLayout(new GridLayout(size, size));
		// SudokuButton 객체를 생성후 button에 끼워 넣어줌
		for (int i = 0; i < size; i++)
			for (int j = 0; j < size; j++) {
				button[i][j] = new SudokuButton(sudoku, this, i, j);
				cp.add(button[i][j]);
			}
		update();
		setTitle("Sudoku Game"); // 제목을 Sudoku Game으로 설정
		setSize(size * button_size + 10, size * button_size + 10); 
		setResizable(false);
		setLocationRelativeTo(null);
		setVisible(true);
	}
	
	/** update - quiz 보드를 그려주는 메소드 */
	public void update() {
		// quiz 보드를 그려주기 위해 SudokuPiece 배열을 생성함
		SudokuPiece[][] r = sudoku.quizBoard();
		
		// quiz보드의 색깔과 번호를 지정
		for (int i = 0; i < 9; i++)
			for (int j = 0; j < 9; j++) {
				// 구멍이 뚫려 있지 않을 경우 배경을 흰 색으로 설정하고 번호를 그려줌
				if (r[i][j] != null) {
					button[i][j].setBackground(Color.white);
					button[i][j].setText("" + r[i][j].valueOf());
					// 글자의 폰트는 "맑은 고딕", 글씨의 효과는 PLAIN, 글씨의 크기는 30으로 설정함
					button[i][j].setFont(new Font("맑은 고딕", Font.PLAIN, 30));
				}
				// 구멍일 경우 배경을 흰색으로 설정함
				else {
					button[i][j].setBackground(Color.black);
					button[i][j].setText("");
				}
			}
		
		// 스도쿠의 구멍이 0개이면 "모두 다 맞추셨습니다." 메시지를 출력
		if (sudoku.sudokuHoles() == 0)
			JOptionPane.showMessageDialog(null, "모두 다 맞추셨습니다.");
	}
	
}
