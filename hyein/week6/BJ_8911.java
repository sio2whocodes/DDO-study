package week6;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class BJ_8911 {
    public static void main(String[] args) throws IOException {
        int[][] dir = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}}; // 위, 오른쪽, 아래, 왼쪽

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int t = Integer.parseInt(br.readLine());

        while (t-- > 0) {
            char[] commands = br.readLine().toCharArray();

            int nd = 0;
            int[] nc = {0, 0};
            int minX = 0;
            int maxX = 0;
            int minY = 0;
            int maxY = 0;

            for (char c : commands) {
                if (c == 'F') {
                    nc[0] += dir[nd][0];
                    nc[1] += dir[nd][1];
                } else if (c == 'B') {
                    nc[0] -= dir[nd][0];
                    nc[1] -= dir[nd][1];
                } else if (c == 'L') {
                    nd -= 1;
                    if (nd < 0) {
                        nd = 3;
                    }
                } else {
                    nd += 1;
                    if (nd > 3) {
                        nd = 0;
                    }
                }
                minX = Math.min(nc[0], minX);
                maxX = Math.max(nc[0], maxX);
                minY = Math.min(nc[1], minY);
                maxY = Math.max(nc[1], maxY);
            }

            System.out.println((maxX - minX) * (maxY - minY));
        }
    }
}
