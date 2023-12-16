package sudoku;

/** SudokuPiece - 각각의 스도쿠 보드의 조각
 * @author 권용욱, 조 은*/
public class SudokuPiece {

	private int number; // 자신의 번호를 필드 변수에 저장
	
	/** Constructor - SudokuPiece를 생성
	 * @param n - SudokuPiece의 번호 */
	public SudokuPiece(int n) {
		number = n; // 필드 변수에 인자로 받은 자신의 번호를 저장함
	}
	
	/** valueOf - SudokuPiece 자신의 번호를 리턴해주는 메소드
	 * @return - 자신의 번호를 리턴함 */
	public int valueOf() {
		return number;
	}
	
}
