package week3;

import java.util.Scanner;

public class BJ_15989 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int t = sc.nextInt();

        StringBuilder sb = new StringBuilder();
        int[][] dp = new int[10001][4];
        for (int i = 0; i < t; i++) {
            int n = sc.nextInt();
            dp[1][1] = dp[2][1] = dp[2][2] = dp[3][1] = dp[3][2] = dp[3][3] = 1;
            for (int j = 4; j <= n; j++) {
                dp[j][1] = dp[j - 1][1];
                dp[j][2] = dp[j - 2][1] + dp[j - 2][2];
                dp[j][3] = dp[j - 3][1] + dp[j - 3][2] + dp[j - 3][3];
            }
            sb.append(dp[n][3] + dp[n][2] + dp[n][1]).append("\n");
        }

        System.out.println(sb);
    }
}
