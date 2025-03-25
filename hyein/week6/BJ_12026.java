package week6;

import java.util.Arrays;
import java.util.Scanner;

public class BJ_12026 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        sc.nextLine();
        char[] arr = sc.nextLine().toCharArray();

        int[] dp = new int[n];
        Arrays.fill(dp, Integer.MAX_VALUE);
        dp[0] = 0;
        for (int i = 1; i < dp.length; i++) {
            for (int j = 0; j < i; j++) {
                int k = i - j;
                if (arr[i] == 'O' && arr[j] == 'B' && dp[j] != Integer.MAX_VALUE) {
                    dp[i] = Math.min(dp[i], dp[j] + k * k);
                } else if (arr[i] == 'J' && arr[j] == 'O' && dp[j] != Integer.MAX_VALUE) {
                    dp[i] = Math.min(dp[i], dp[j] + k * k);
                } else if (arr[i] == 'B' && arr[j] == 'J' && dp[j] != Integer.MAX_VALUE) {
                    dp[i] = Math.min(dp[i], dp[j] + k * k);
                }

            }
        }
        System.out.println((dp[n - 1] == Integer.MAX_VALUE) ? -1 : dp[n - 1]);
    }
}

