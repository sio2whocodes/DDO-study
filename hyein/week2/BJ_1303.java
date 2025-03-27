package week2;

import java.util.Scanner;

public class BJ_1303 {
    static int n;
    static int m;
    static char[][] map;
    static boolean[][] visited;

    static int[][] d = {{-1,0}, {1,0}, {0,-1}, {0,1}};
    static int cnt;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        n = sc.nextInt();
        m = sc.nextInt();
        sc.nextLine();

        map = new char[m][n];
        for (int i = 0; i < m; i++) {
            String s = sc.nextLine();
            for (int j = 0; j < n; j++) {
                map[i][j] = s.charAt(j);
            }
        }

        int white = 0;
        int black = 0;

        visited = new boolean[m][n];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if(!visited[i][j]) {
                    char color = map[i][j];
                    cnt = 0;
                    dfs(i, j);

                    if (color == 'W') {
                        white += Math.pow(cnt, 2);
                    } else {
                        black += Math.pow(cnt, 2);
                    }
                }
            }
        }

        System.out.printf("%d %d\n", white, black);
    }

    public static void dfs(int row, int col) {
        char color = map[row][col];
        visited[row][col] = true;
        cnt++;

        for (int i = 0; i < 4; i++) {
            int nr = row + d[i][0];
            int nc = col + d[i][1];

            if (nr < 0 || nr >= m || nc < 0 || nc >= n) continue;
            if (!visited[nr][nc] && map[nr][nc] == color) {
                dfs(nr, nc);
            }
        }
    }
}
