import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.StringTokenizer;

public class BJ_9470 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int t = Integer.parseInt(br.readLine());

        StringBuilder sb = new StringBuilder();

        while (t-- > 0) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int k = Integer.parseInt(st.nextToken());
            int m = Integer.parseInt(st.nextToken());
            int p = Integer.parseInt(st.nextToken());

            ArrayList<Integer>[] graph = new ArrayList[m + 1];
            int[] in_cnt = new int[m + 1];
            int[] max_cnt = new int[m + 1];
            int[] order = new int[m + 1];

            for (int i = 0; i <= m; i++) {
                graph[i] = new ArrayList<>();
            }

            for (int i = 0; i < p; i++) {
                st = new StringTokenizer(br.readLine());
                int a = Integer.parseInt(st.nextToken());
                int b = Integer.parseInt(st.nextToken());
                graph[a].add(b);
                in_cnt[b]++;
            }

            LinkedList<Integer> queue = new LinkedList<>();
            for (int i = 1; i <= m; i++) {
                if (in_cnt[i] == 0) {
                    queue.add(i);
                    order[i]++;
                    max_cnt[i]++;
                }
            }

            int answer = 0;
            while (!queue.isEmpty()) {
                int x = queue.poll();
                if (max_cnt[x] >= 2) order[x]++;
                answer = Math.max(answer, order[x]);

                for (int y : graph[x]) {
                    in_cnt[y]--;
                    if (in_cnt[y] == 0) queue.add(y);
                    if (order[y] == order[x]) max_cnt[y]++;
                    else if (order[y] < order[x]) {
                        order[y] = order[x];
                        max_cnt[y] = 1;
                    }
                }
            }

            sb.append(k).append(" ").append(answer).append("\n");
        }

        System.out.println(sb);
    }
}
