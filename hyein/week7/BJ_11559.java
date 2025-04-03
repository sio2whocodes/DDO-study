package week7;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class BJ_11559 {
    static int[][] dir = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
    static char[][] board = new char[12][6];
    static boolean flag;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        for (int i = 0; i < 12; i++) {
            String str = br.readLine();
            for (int j = 0; j < 6; j++) {
                board[i][j] = str.charAt(j);
            }
        }

        int answer = 0;
        while (true) {
            flag = false;
            boolean[][] visited = new boolean[12][6];

            for (int i = 0; i < 12; i++) {
                for (int j = 0; j < 6; j++) {
                    if (board[i][j] != '.' && !visited[i][j]) {
                        bfs(i, j, board[i][j], visited);
                    }
                }
            }

            if (!flag) {
                break;
            }

            dropPuyo();
            answer++;
        }
        System.out.print(answer);
    }

    private static void bfs(int startX, int startY, char ch, boolean[][] visited) {
        ArrayDeque<int[]> queue = new ArrayDeque<>();
        ArrayList<int[]> list = new ArrayList<>();

        queue.add(new int[]{startX, startY});
        list.add(new int[]{startX, startY});
        visited[startX][startY] = true;

        int count = 1;

        while (!queue.isEmpty()) {
            int[] now = queue.poll();
            for (int i = 0; i < 4; i++) {
                int nx = now[0] + dir[i][0];
                int ny = now[1] + dir[i][1];
                if (nx >= 0 && ny >= 0 && nx < 12 && ny < 6 && board[nx][ny] == ch && !visited[nx][ny]) {
                    queue.add(new int[]{nx, ny});
                    list.add(new int[]{nx, ny});
                    visited[nx][ny] = true;
                    count++;
                }
            }
        }

        if (count >= 4) {
            flag = true;
            for (int[] p : list) {
                board[p[0]][p[1]] = '.';
            }
        }
    }

    private static void dropPuyo() {
        for (int i = 0; i < 6; i++) {
            ArrayDeque<Character> queue = new ArrayDeque<>();
            for (int j = 11; j >= 0; j--) {
                if (board[j][i] != '.') {
                    queue.add(board[j][i]);
                }
            }
            for (int j = 11; j >= 0; j--) {
                if (!queue.isEmpty()) {
                    board[j][i] = queue.poll();
                } else {
                    board[j][i] = '.';
                }
            }
        }
    }
}
