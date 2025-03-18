package week5;

import java.util.Scanner;

public class BJ_11058 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();

        long[] dp = new long[n + 1];
        for (int i = 1; i <= n; i++) {
            dp[i] = dp[i-1] + 1;
            if (i > 6) {
                for (int j = 3; j <= 5; j++) {
                    dp[i] = Math.max(dp[i], dp[i - j] * (j - 1));
                }
            }
        }

        System.out.println(dp[n]);
    }
}
