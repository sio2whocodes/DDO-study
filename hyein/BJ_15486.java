import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class BJ_15486 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());

        int[] time = new int[n + 2];
        int[] price = new int[n + 2];

        for (int i = 1; i <= n; i++) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int t = Integer.parseInt(st.nextToken());
            int p = Integer.parseInt(st.nextToken());

            time[i] = t;
            price[i] = p;
        }

        int[] dp = new int[n + 2];
        int max = -1;
        for (int i = 1; i <= n + 1; i++) {
            if (max < dp[i]) max = dp[i];

            int t = i + time[i];
            int p = price[i];

            if (t <= n + 1) {
                dp[t] = Math.max(dp[t], max + p);
            }
        }

//        System.out.println(Arrays.toString(time));
//        System.out.println(Arrays.toString(price));
//        System.out.println(Arrays.toString(dp));

        System.out.println(dp[n + 1]);
    }
}
