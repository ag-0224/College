package sudoku;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

/** Difficulty 게임의 난이도를 사용자에게 받기 위해 창을 생성함
 * @author 권용욱, 조 은 */
public class Difficulty extends JFrame {
	
	/** Constructor - Difficulty 난이도 창을 생성함 - 버튼은 총 4개, Easy, Normal, Hard 그리고 Exit 로 구성됨  */
	public Difficulty() {
		Container cp = getContentPane(); 
		cp.setLayout(new BorderLayout());
		JPanel p = new JPanel(new FlowLayout());
		cp.add(p);
		
		p.add(new DifficultyButton("Easy"));
		p.add(new DifficultyButton("Normal"));
		p.add(new DifficultyButton("Hard"));
		p.add(new ExitButton("Exit"));
		
		setTitle("Game Manager"); // 제목 이름은 Game Manager 로 설정
		setSize(250, 110); // 가로 길이 : 250, 세로 길이 : 110
		
		setResizable(false); // 사이즈 조정 불가능
		setLocationRelativeTo(null); // 생성시 화면 가운데로 오게함
		setVisible(true);
	}
	
}
