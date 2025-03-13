import java.util.Scanner;

public class BJ_1743 {
    static int n, m, k;
    static int[][] board;
    static boolean[][] visited;
    static int[][] dir = {{-1, 0}, {0, 1}, {1, 0}, {0, -1}}; // 위, 오른쪽, 아래, 왼쪽
    static int cnt;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        n = sc.nextInt();
        m = sc.nextInt();
        k = sc.nextInt();

        board = new int[n + 1][m + 1];
        visited = new boolean[n + 1][m + 1];

        while (k-- > 0) {
            int r = sc.nextInt();
            int c = sc.nextInt();
            board[r][c] = 1;
        }

        int result = 0;
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                cnt = 0;
                if (board[i][j] == 1 && !visited[i][j]) dfs(i, j);
                result = Math.max(result, cnt);
            }
        }

        System.out.println(result);
    }

    public static void dfs(int r, int c) {
        visited[r][c] = true;
        cnt++;

        for (int i = 0; i < 4; i++) {
            int nr = r + dir[i][0];
            int nc = c + dir[i][1];
            if (nr < 1 || nr > n || nc < 1 || nc > m) continue;
            if (board[nr][nc] == 1 && !visited[nr][nc]) dfs(nr, nc);
        }
    }
}
