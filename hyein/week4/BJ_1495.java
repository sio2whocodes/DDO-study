package week4;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class BJ_1495 {
    public static void main(String[] args) {
        int n, s, m;

        Scanner sc = new Scanner(System.in);
        n = sc.nextInt();
        s = sc.nextInt();
        m = sc.nextInt();

        int[] dp = new int[m + 1];
        for (int i = 0; i <= m; i++) {
            dp[i] = -1;
        }
        dp[s] = 0;

        for (int i = 1; i <= n; i++) {
            int v = sc.nextInt();
            List<Integer> list = new ArrayList<>();

            for (int j = 0; j <= m; j++) {
                if (dp[j] == i - 1) {
                    int plus = j + v;
                    int minus = j - v;
                    if (plus >= 0 && plus <= m) {
//                        dp[plus] = i;
                        list.add(plus);
                    }
                    if (minus >= 0 && minus <= m) {
//                        dp[minus] = i;
                        list.add(minus);
                    }
                }
            }

            for (int a : list) {
                dp[a] = i;
            }
        }

        int result = -1;
        for (int i = 0; i <= m; i++) {
            if (dp[i] == n) {
                result = Math.max(result, i);
            }
        }

        System.out.println(result);
    }
}
