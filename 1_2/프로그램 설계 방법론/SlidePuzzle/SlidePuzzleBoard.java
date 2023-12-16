package slidepuzzle;

/** SlidePuzzleBoard models a slide puzzle. */ 
public class SlidePuzzleBoard { 
	private int size;
	private PuzzlePiece[][] board;
	
	// 빈칸의 좌표 
	private int empty_row;
	private int empty_col;
	
	// representation invariant: board[empty_row][empty_col] == null
	
	/** Constructor - SlidePuzzleBoard 초기 퍼즐 보드 설치 - 감소하는 순으로 나열 
	 * @param s - 퍼즐 보드 크기 */
	public SlidePuzzleBoard(int s) { 
		size = s;
		board = new PuzzlePiece[size][size];
		
		// 퍼즐 조각을 역순으로 나열 
		for (int num = 1; num != size * size; num = num + 1) { 
			PuzzlePiece p = new PuzzlePiece(num);
			int row = num / size;
			int col = num % size;
			// set p in a ‘‘reversed position’’ on the board: 
			board[size-1-row][size-1-col] = p;
		}
		// 퍼즐 조각이 없는 빈칸의 좌표 기억  
		empty_row = size - 1;
		empty_col = size - 1;
	}

	/** contents - 현재 퍼즐 보드를 카피하여 리턴 
    * @return 퍼즐 보드 배열 리턴  */
	public PuzzlePiece[][] contents() { 
		PuzzlePiece[][] answer = new PuzzlePiece[size][size];
		for(int i = 0; i != size; i = i + 1) 
			for(int j = 0; j != size; j = j + 1)
				answer[i][j] = board[i][j];
		return answer;
	}
	
	/** move moves a piece into the blank space, provided it is a legal move. 
	 * @param w - the face value of the piece that one wishes to move
	 * @return true, if the piece labelled w was moved into the empty space;
	 *  return false if the piece cannot be moved into the empty space */
	public boolean move(int w) { 
		int NOT_FOUND = -1;
		int row = NOT_FOUND; // w의 행 번호
		int col = NOT_FOUND; // w의 열 번호
		// 빈칸에 인접한 w의 위치를 찾음 
		if (found(w, empty_row - 1, empty_col)) {
			row = empty_row - 1;
			col = empty_col;
		}
		else if (found(w, empty_row + 1, empty_col)) {
			row = empty_row + 1;
			col = empty_col;
		}
		else if (found(w, empty_row, empty_col - 1)) {
			row = empty_row;
			col = empty_col - 1;
		}
		else if (found(w, empty_row, empty_col + 1)) {
			row = empty_row;
			col = empty_col + 1;
		}
		
		if (row != NOT_FOUND) {
			board[empty_row][empty_col] = board[row][col];
			empty_row = row;
			empty_col = col;
			board[empty_row][empty_col] = null;
		}
		return row != NOT_FOUND;
	}
	
	/** found - row, col 위치에 있는 퍼즐 조각이 v 인지 확인  */ 
	private boolean found(int v, int row, int col) { 
		boolean answer = false;
		if(row >= 0 && row < size && col >= 0 && col < size) { 
			answer = board[row][col].valueOf() == v; 
		}
	    return answer;
	}
}
	
