package sudoku;

import javax.swing.*;

/** Sudoku - Sudoku 게임에 필요한 것을 생성함
 * @author 권용욱, 조 은 */
public class Sudoku {
	
	private int hole; // 구멍 갯수를 필드 변수에 저장
	private SudokuBoard board; // SudokuBoard를 필드 변수에 저장
	private SudokuPiece[][] solution; // 정답 보드를 필드 변수에 저장
	private SudokuPiece[][] quiz; // 퀴즈 보드를 필드 변수에 저장
	
	/** Constructor - Sudoku 게임에 필요한 정답 보드를 만들고 난후 정답 보드에 구멍을 뚫어 퀴즈 보드를 생성함
	 * @param b - SudokuBoard를 인자로 받아 필드 변수에 저장함
	 * @param h - 구멍의 개수를 인자로 받아 필드 변수에 저장함 */
	public Sudoku(SudokuBoard b, int h) {
		board = b;
		hole = h;
		solution = board.getBoard();
		quiz = new SudokuPiece[9][9];
		for (int i = 0; i < 9; i++)
			for (int j = 0; j < 9; j++) {
				// 정답 보드에 있는 정보를 퀴즈 보드에 저장함
				quiz[i][j] = solution[i][j]; 
			}
		// 인자로 받은 구멍의 개수에 도달할 때까지 구멍을 뚫음
		while (sudokuHoles() < hole) { 
			int shuffle1 = (int)(Math.random() * 9);
			int shuffle2 = (int)(Math.random() * 9);
			 // 무작위로 생성한 위치에 구멍을 뚫음
			quiz[shuffle1][shuffle2] = null;
		}
	}
	
	/** play - 사용자가 지정한 위치의 정답을 퀴즈 보드에 끼워 넣어 주도록 하는 메소드
	 * @param row - 사용자가 지정한 위치의 헹
	 * @param col - 사용자가 지정한 위치의 열
	 * @param f - 사용자가 지정한 위치의 답
	 * @return result - 정답이면 true, 그렇지 않으면 false를 리턴함 */
	public boolean play(int row, int col, int f) {
		// 사용자가 지정한 위치의 답이 스도쿠 퀴즈의 정답과 일치하는 지의 결과를 result에 저장함
		boolean result = solution[row][col].valueOf() == f;
		// 정답일 경우, 정답을 quiz 보드에 끼워 넣은 후, result를 리턴함
		if (result) {
			quiz[row][col] = new SudokuPiece(f);
			return result;
		}
		// 정답이 아닐 경우 "다시 한 번 생각해보세요." 메시지 출력과 함께 result를 리턴함
		else {
			JOptionPane.showMessageDialog(null, "다시 한 번 생각해보세요.");
			return result;
		}
	}
	
	/** sudokuHoles - 현재 스도쿠의 구멍 갯수를 확인하는 메소드
	 * @return count - 센 구멍 갯수를 리턴함 */
	public int sudokuHoles() {
		int count = 0;
		for (int i = 0; i < 9; i++)
			for (int j = 0; j < 9; j++) {
				if (quiz[i][j] == null)
					count += 1;
			}
		return count;
	}
	
	
	/** quizBoard - 퀴즈 보드를 사용자에게 보여주도록 하기 위해 퀴즈 보드를 리턴해주는 메소드
	 * @return - 퀴즈 보드를 리턴함*/
	public SudokuPiece[][] quizBoard() {
		return quiz;
	}
	
}
