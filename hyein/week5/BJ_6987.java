package week5;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class BJ_6987 {
    static int[][] match = new int[6][3];
    static int answer = 0;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();
        StringTokenizer st;

        for (int i = 0; i < 4; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            answer = 0;

            for (int j = 0; j < 18; j++) match[j / 3][j % 3] = Integer.parseInt(st.nextToken());

            boolean flag = false;
            for (int j = 0; j < 6; j++) {
                if (match[j][0] + match[j][1] + match[j][2] != 5) {
                    flag = true;
                    break;
                }
            }

            if (!flag) play(0, 1);

            sb.append(answer).append(" ");
        }

        System.out.print(sb);
    }

    private static void play(int idx, int nxt) {
        if (answer == 1) return;

        if (idx == 5) {
            answer = 1;
            return;
        }

        if (match[idx][0] > 0 && match[nxt][2] > 0) {
            match[idx][0]--;
            match[nxt][2]--;

            if (nxt == 5) play(idx + 1, idx + 2);
            else play(idx, nxt + 1);

            match[idx][0]++;
            match[nxt][2]++;
        }

        if (match[idx][1] > 0 && match[nxt][1] > 0) {
            match[idx][1]--;
            match[nxt][1]--;

            if (nxt == 5) play(idx + 1, idx + 2);
            else play(idx, nxt + 1);

            match[idx][1]++;
            match[nxt][1]++;
        }

        if (match[idx][2] > 0 && match[nxt][0] > 0) {
            match[idx][2]--;
            match[nxt][0]--;

            if (nxt == 5) play(idx + 1, idx + 2);
            else play(idx, nxt + 1);

            match[idx][2]++;
            match[nxt][0]++;
        }
    }
}
