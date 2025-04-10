package week8;

import java.util.ArrayDeque;
import java.util.Scanner;

public class BJ_13549 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int k = sc.nextInt();

        int[] time = new int[100_001];
        boolean[] visited = new boolean[100_001];

        ArrayDeque<Integer> queue = new ArrayDeque<>();
        queue.add(n);
        visited[n] = true;

        if (n == k) {
            System.out.println(time[k]);
            return;
        }

        while (!queue.isEmpty()) {
            int cur = queue.poll();

            int[] next_arr = {cur * 2, cur - 1, cur + 1};

            for (int i = 0; i < 3; i++) {
                int next = next_arr[i];

                if (next < 0 || next > 100_000 || visited[next]) continue;

                if (i != 0) {
                    visited[next] = true;
                    if (time[next] == 0) {
                        time[next] = time[cur] + 1;
                    } else {
                        time[next] = Math.min(time[next], time[cur] + 1);
                    }
                } else {
                    visited[next] = true;
                    if (time[next] == 0) {
                        time[next] = time[cur];
                    } else {
                        time[next] = Math.min(time[next], time[cur]);
                    }
                }

                queue.add(next);
            }
        }

        System.out.println(time[k]);
    }
}
