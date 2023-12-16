package sudoku;

/** SudokuBoard - 게임에 필요한 스도쿠 문제를 생성
 * @author 권용욱, 조 은 */
public class SudokuBoard {
	
	private int count; // 섞는 횟수를 필드 변수에 저장
	private SudokuPiece[][] board; // SudokuPiece 배열을 필드 변수에 저장
	
	/** Constructor - SudokuBoard를 생성 */
	public SudokuBoard() {
		count = 10; // 섞는 횟수는 10번으로 함.
	}
	
	/** initializeBoard - 스도쿠 보드를 생성함 */
	public void initializeBoard() {
		SudokuPiece[] row0 = new SudokuPiece[9];
		
		// 스도쿠 보드의 첫번째 행의 배열을 생성함
		for (int i = 0; i < 9; i++) {
			// 객체를 끼워 넣어줌
			row0[i] = new SudokuPiece(i + 1);
		}
		
		// 첫번째 행의 배열을 섞기 횟수만큼 섞어줌
		for (int i = 0; i < count; i++) {
			int shuffle = (int)(Math.random() * 9);
			SudokuPiece tmp = row0[0];
			row0[0] = row0[shuffle];
			row0[shuffle] = tmp;
		}
		
		// 스도쿠 행을 모두 생성함
		SudokuPiece[] row1 = {row0[6], row0[7], row0[8], row0[0], row0[1], row0[2], row0[3], row0[4], row0[5]};
		SudokuPiece[] row2 = {row0[3], row0[4], row0[5], row0[6], row0[7], row0[8], row0[0], row0[1], row0[2]};
		SudokuPiece[] row3 = {row0[2], row0[0], row0[1], row0[5], row0[3], row0[4], row0[8], row0[6], row0[7]};
		SudokuPiece[] row4 = {row3[6], row3[7], row3[8], row3[0], row3[1], row3[2], row3[3], row3[4], row3[5]};
		SudokuPiece[] row5 = {row3[3], row3[4], row3[5], row3[6], row3[7], row3[8], row3[0], row3[1], row3[2]};
		SudokuPiece[] row6 = {row0[1], row0[2], row0[0], row0[4], row0[5], row0[3], row0[7], row0[8], row0[6]};
		SudokuPiece[] row7 = {row6[6], row6[7], row6[8], row6[0], row6[1], row6[2], row6[3], row6[4], row6[5]};
		SudokuPiece[] row8 = {row6[3], row6[4], row6[5], row6[6], row6[7], row6[8], row6[0], row6[1], row6[2]};
		
		// 필드 변수에 만들어 둔 스도쿠 보드를 저장함
		board = new SudokuPiece[][] {row0, row1, row2, row3, row4, row5, row6, row7, row8};
	}
	
	/** shuffleRibbons - 스도쿠 섞기 규칙에 따라 top, middle, bottom 3부분으로 나누어 섞어 줌 */
	public void shuffleRibbons() {
		// top은 board의 첫 번째, 두 번째, 세 번째 행
		SudokuPiece[][] top = {board[0], board[1], board[2]};
		
		// top을 골고루 섞기 횟수만큼 섞어줌
		for (int j = 0; j < count; j++) {
			int shuffle = (int)(Math.random() * 3);
			SudokuPiece[] tmp = top[0];
			top[0] = top[shuffle];
			top[shuffle] = tmp;
		}
		
		// middle은 board의 네 번째, 다섯 번째, 여섯 번째 행
		SudokuPiece[][] middle = {board[3], board[4], board[5]};
		
		// middle을 골고루 섞기 횟수만큼 섞어줌
		for (int j = 0; j < count; j++) {
			int shuffle = (int)(Math.random() * 3);
			SudokuPiece[] tmp = middle[0];
			middle[0] = middle[shuffle];
			middle[shuffle] = tmp;
		}
		
		// bottom은 board의 일곱 번째, 여덟 번째, 아홉 번째 행
		SudokuPiece[][] bottom = {board[6], board[7], board[8]};
		
		// bottom을 골고루 섞기 횟수만큼 섞어줌
		for (int j = 0; j < count; j++) {
			int shuffle = (int)(Math.random() * 3);
			SudokuPiece[] tmp = bottom[0];
			bottom[0] = bottom[shuffle];
			bottom[shuffle] = tmp;
		}
		
		// top, middle, bottom의 행을 모두 합쳐 보드에 저장함
		board = new SudokuPiece[][] {top[0], top[1], top[2], middle[0], middle[1], middle[2], bottom[0], bottom[1], bottom[2]};
	}
	
	/** transpose - 스도쿠 규칙에 따라 보드의 열끼리 섞기 위해 행과 열의 위치를 바꿔주는 메소드 */
	public void transpose() {
		// 위치를 바꾼 보드를 저장하기 위해 tmp 배열을 생성함
		SudokuPiece[][] tmp = new SudokuPiece[9][9];
		
		// 행과 열의 위치를 바꿔줌
		for (int i = 0; i < 9; i++) 
			for (int j = 0; j < 9; j++) {
				tmp[i][j] = board[j][i];
			}
		
		// 위치를 바꾼 보드를 필드 변수에 저장
		board = tmp;
	}
	
	/** getBoard - 스도쿠 보드의 섞기 규칙에 따라 섞고 섞은 결과를 리턴해주는 메소드
	 * @return - 스도쿠 보드를 리턴 */
	public SudokuPiece[][] getBoard() {
		// 보드를 생성함
		this.initializeBoard();
		// 세 부분으로 나누어 섞어줌
		this.shuffleRibbons();
		// 열끼리 섞기 위해 행과 열을 섞어줌
		this.transpose();
		this.shuffleRibbons();
		this.transpose();
		SudokuPiece[][] r = new SudokuPiece[9][9];
		for (int i = 0; i < 9; i++)
			for (int j = 0; j < 9; j++) {
				r[i][j] = board[i][j];
			}
		return r;
	}
	
}

