package week8;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class BJ_5557 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());

        int[] num = new int[n - 1];
        StringTokenizer st = new StringTokenizer(br.readLine());
        for (int i = 0; i < n - 1; i++) {
            num[i] = Integer.parseInt(st.nextToken());
        }
        int answer = Integer.parseInt(st.nextToken());

        long[][] dp = new long[n - 1][21];
        dp[0][num[0]] = 1;
        for (int i = 1; i < n - 1; i++) {
            for (int j = 0; j <= 20; j++) {
                if (j - num[i] >= 0) dp[i][j] += dp[i - 1][j - num[i]];
                if (j + num[i] <= 20) dp[i][j] += dp[i - 1][j + num[i]];
            }
        }
        System.out.println(dp[n - 2][answer]);
    }
}
