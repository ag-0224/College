package slidepuzzle;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class PuzzleFrame extends JFrame {
	
	private SlidePuzzleBoard board;
	private int size = 4;
	private int button_size = 60;
	private PuzzleButton[][] button;
	
	public PuzzleFrame(int board_size, SlidePuzzleBoard b) {
		size = board_size;
		board = b;
		button = new PuzzleButton[size][size];
		Container cp = getContentPane();
		cp.setLayout(new GridLayout(size, size));
		for (int i = 0; i < size; i++)
			for (int j = 0; j < size; j++) {
				button[i][j] = new PuzzleButton(board, this);
				cp.add(button[i][j]);
			}
		update();
		setTitle("Slide Puzzle");
		setSize(size * button_size + 10, size * button_size + 10);
		setVisible(true);
	}
	
	public void update() {
		PuzzlePiece[][] r = board.contents();
		for (int i = 0; i < size; i++)
			for (int j = 0; j < size; j++) {
				if (r[i][j] != null) {
					button[i][j].setBackground(Color.white);
					button[i][j].setText("" + r[i][j].valueOf());
				}
				else {
					button[i][j].setBackground(Color.black);
					button[i][j].setText("");
				}
			}
	}
	
}
