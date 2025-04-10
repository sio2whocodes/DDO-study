package week8;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

public class BJ_1141 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());

        String[] strings = new String[N];
        for (int i = 0; i < N; i++) {
            strings[i] = br.readLine();
        }

        Arrays.sort(strings);

        int ans = N;
        for(int i = 0; i < N; i++){
            for(int j = i+1; j < N; j++){
                if(strings[j].startsWith(strings[i])){
                    ans--;
                    break;
                }
            }
        }

        System.out.println(ans);
    }
}
