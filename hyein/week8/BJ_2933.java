package week8;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class BJ_2933 {
    static int r;
    static int c;
    static char[][] cave;
    static int[][] dir = {{}, {-1, 0}, {0, 1}, {1, 0}, {0, -1}};
    static int[][] group;
    static int[] mh;

    public static void main(String[] args) throws IOException {
        // Input
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        r = Integer.parseInt(st.nextToken());
        c = Integer.parseInt(st.nextToken());

        cave = new char[r + 1][c + 1];
        for (int i = 1; i <= r; i++) {
            char[] cols = br.readLine().toCharArray();
            for (int j = 0; j < c; j++) {
                cave[i][j + 1] = cols[j];
            }
        }

        int n = Integer.parseInt(br.readLine());
        st = new StringTokenizer(br.readLine());
        int[] h = new int[n];
        for (int i = 0; i < n; i++) {
            h[i] = Integer.parseInt(st.nextToken());
        }

        // Solve
        for (int i = 0; i < n; i++) {
            int cur = r + 1 - h[i];
            int[] target = new int[2];

            if (i % 2 == 0) {
                for (int j = 1; j <= c; j++) {
                    if (cave[cur][j] == 'x') {
                        cave[cur][j] = '.';
                        target[0] = cur;
                        target[1] = j;
                        break;
                    }
                }
            } else {
                for (int j = c; j > 0; j--) {
                    if (cave[cur][j] == 'x') {
                        cave[cur][j] = '.';
                        target[0] = cur;
                        target[1] = j;
                        break;
                    }
                }
            }

            group = new int[r + 1][c + 1];
            mh = new int[5];
            for (int k = 1; k <= 4; k++) {
                int sr = target[0] + dir[k][0];
                int sc = target[1] + dir[k][1];

                if (sr < 1 || sr > r || sc < 1 || sc > c) continue;
                if (cave[sr][sc] == 'x' && group[sr][sc] == 0) {
                    dfs(sr, sc, k);
                }
            }

            int g = -1;
            for (int k = 1; k <= 4; k++) {
                if (mh[k] != 0 && mh[k] != r) {
                    g = k;
                }
            }
            if (g == -1) continue;

            int[] length = new int[c + 1];
            for (int j = 1; j <= c; j++) {
                int start = 0;
                int end = r + 1;
                for (int k = 1; k <= r; k++) {
                    if (group[k][j] == g) {
                        start = k;
                    }
                    if (start != 0 && k > start && group[k][j] != g && group[k][j] != 0) {
                        end = k;
                        break;
                    }
                }

                length[j] = end - start - 1;
            }

            int ml = Integer.MAX_VALUE;
            for (int j = 1; j <= c; j++) {
                ml = Math.min(ml, length[j]);
            }

            for (int j = 1; j <= c; j++) {
                for (int k = r - ml; k > 0; k--) {
                    if (group[k][j] == g) {
                        cave[k][j] = '.';
                        cave[k + ml][j] = 'x';
                    }
                }
            }
        }

        for (int i = 1; i <= r; i++) {
            for (int j = 1; j <= c; j++) {
                System.out.print(cave[i][j]);
            }
            System.out.println();
        }


    }

    public static void dfs(int cr, int cc, int gn) {
        group[cr][cc] = gn;
        mh[gn] = Math.max(mh[gn], cr);
        for (int i = 1; i <= 4; i++) {
            int nr = cr + dir[i][0];
            int nc = cc + dir[i][1];

            if (nr < 1 || nr > r || nc < 1 || nc > c) continue;
            if (cave[nr][nc] == 'x' && group[nr][nc] == 0) {
                dfs(nr, nc, gn);
            }
        }
    }
}
