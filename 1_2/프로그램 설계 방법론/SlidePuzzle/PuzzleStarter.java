package slidepuzzle;

public class PuzzleStarter {

	public static void main(String[] args) {
		int SIZE = 4;
		SlidePuzzleBoard board = new SlidePuzzleBoard(SIZE);
		new PuzzleFrame(SIZE, board);
	}
}
