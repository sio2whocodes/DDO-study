package week7;

import java.util.ArrayDeque;
import java.util.Scanner;

public class BJ_12851 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int k = sc.nextInt();

        int[] time = new int[100_001];
        int cnt = 0;

        ArrayDeque<Integer> queue = new ArrayDeque<>();

        queue.add(n);

        if (n==k) {
            cnt++;
            System.out.println(time[k]);
            System.out.println(cnt);
            return;
        }

        while(!queue.isEmpty()) {
            int cur = queue.poll();
            int[] next_arr = {cur + 1, cur - 1, cur * 2};

            for(int next: next_arr) {
                if (next<0 || next>100_000 || (time[next] != 0 && time[next] < time[cur]+1)) continue;
                time[next] = time[cur]+1;
                queue.add(next);

                if (next == k) cnt ++;
            }
        }

        System.out.println(time[k]);
        System.out.println(cnt);
    }
}
