import java.util.Scanner;

public class BJ_16197 {
    static int n;
    static int m;
    static char[][] board;
    static int[][] coin;
    static int[][] dir = {{0, -1}, {0, 1}, {-1, 0}, {1, 0}}; // 왼쪽, 오른쪽, 위, 아래
    static int result = 20;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        n = sc.nextInt();
        m = sc.nextInt();
        sc.nextLine();

        board = new char[n][m];
        coin = new int[2][2];

        int coin_cnt = 0;
        for (int i = 0; i < n; i++) {
            String row = sc.nextLine();
            char[] v = row.toCharArray();
            for (int j = 0; j < m; j++) {
                board[i][j] = v[j];
                if (v[j] == 'o') {
                    coin[coin_cnt][0] = i;
                    coin[coin_cnt][1] = j;
                    coin_cnt++;
                }
            }
        }

        dfs(coin[0][0], coin[0][1], coin[1][0], coin[1][1], 0);

        if (result == 20) System.out.println(-1);
        else System.out.println(result);
    }

    public static void dfs(int coin1r, int coin1c, int coin2r, int coin2c, int cnt) {
        if (cnt > 10) return;
        if (check_coin_out(coin1r, coin1c) && check_coin_out(coin2r, coin2c)) return;

        if (check_coin_out(coin1r, coin1c) || check_coin_out(coin2r, coin2c)) {
            if (cnt < result) result = cnt;
            return;
        }

        for (int i = 0; i < 4; i++) {
            int[] d = dir[i];
            int next1r = coin1r + d[0];
            int next1c = coin1c + d[1];
            int next2r = coin2r + d[0];
            int next2c = coin2c + d[1];

            if (!check_move(next1r, next1c) && !check_move(next2r, next2c)) {
                continue;
            }
            if (!check_move(next1r, next1c)) {
                next1r = coin1r;
                next1c = coin1c;
            }
            if (!check_move(next2r, next2c)) {
                next2r = coin2r;
                next2c = coin2c;
            }

            dfs(next1r, next1c, next2r, next2c, ++cnt);
            cnt--;
        }
    }

    public static boolean check_coin_out(int row, int col) {
        if (row < 0 || row >= n) return true;
        if (col < 0 || col >= m) return true;
        return false;
    }

    public static boolean check_move(int row, int col) {
        if (row >= 0 && row < n && col >= 0 && col < m && board[row][col] == '#') return false;
        return true;
    }
}

