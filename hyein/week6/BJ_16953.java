package week6;

import java.util.Scanner;

public class BJ_16953 {
    static long a, b;
    static int answer;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        a = sc.nextLong();
        b = sc.nextLong();

        answer = Integer.MAX_VALUE;
        dfs(a, 0);

        if (answer == Integer.MAX_VALUE) System.out.println(-1);
        else System.out.println(answer + 1);
    }

    public static void dfs(long n, int cnt) {
        if (n > b) return;
        if (n == b) {
            answer = Math.min(cnt, answer);
            return;
        }

        dfs(n * 2, cnt + 1);
        dfs(Long.parseLong(n + "1"), cnt + 1);
    }
}
