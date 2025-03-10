import java.util.Scanner;

public class BJ_2290 {
    static int s;
    static String dash = "-";

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        s = sc.nextInt();
        String n = sc.nextLine().trim();

        char[] charArray = n.toCharArray();
        int[] intArray = new String(charArray)
                .chars()
                .map(c -> c - '0')
                .toArray();

        StringBuilder first = new StringBuilder();
        StringBuilder up = new StringBuilder();
        StringBuilder mid = new StringBuilder();
        StringBuilder down = new StringBuilder();
        StringBuilder last = new StringBuilder();

        for (int num : intArray) {
            first.append(getFirst(num) + " ");
            up.append(getUp(num) + " ");
            mid.append(getMid(num) + " ");
            down.append(getDown(num) + " ");
            last.append(getLast(num) + " ");
        }

        int length = 2 * s + 3;
        int midIndex = length / 2;

        StringBuilder result = new StringBuilder();
        for (int i = 0; i < length; i++) {
            if (i == 0) {
                result.append(first);
                result.append("\n");
            } else if (i < midIndex) {
                result.append(up);
                result.append("\n");
            } else if (i == midIndex) {
                result.append(mid);
                result.append("\n");
            } else if (i == length - 1) {
                result.append(last);
            } else {
                result.append(down);
                result.append("\n");
            }
        }

        System.out.println(result);
    }

    public static String getFirst(int num) {
        return switch (num) {
            case 0, 2, 3, 5, 6, 7, 8, 9 -> " " + dash.repeat(s) + " ";
            case 1, 4 -> " ".repeat(s + 2);
            default -> "";
        };
    }

    public static String getUp(int num) {
        return switch (num) {
            case 1, 2, 3, 7 -> " ".repeat(s + 1) + "|";
            case 5, 6 -> "|" + " ".repeat(s + 1);
            case 0, 4, 8, 9 -> "|" + " ".repeat(s) + "|";
            default -> "";
        };
    }

    public static String getMid(int num) {
        return switch (num) {
            case 2, 3, 4, 5, 6, 8, 9 -> " " + dash.repeat(s) + " ";
            case 0, 1, 7 -> " ".repeat(s + 2);
            default -> "";
        };
    }

    public static String getDown(int num) {
        return switch (num) {
            case 1, 3, 4, 5, 7, 9 -> " ".repeat(s + 1) + "|";
            case 2 -> "|" + " ".repeat(s + 1);
            case 0, 6, 8 -> "|" + " ".repeat(s) + "|";
            default -> "";
        };
    }

    public static String getLast(int num) {
        return switch (num) {
            case 0, 2, 3, 5, 6, 8, 9 -> " " + dash.repeat(s) + " ";
            case 1, 4, 7 -> " ".repeat(s + 2);
            default -> "";
        };
    }
}
