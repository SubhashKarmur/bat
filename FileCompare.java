package com.subhash;

import org.apache.commons.io.FileUtils;

import java.io.*;
import java.nio.file.Path;
import java.nio.file.Paths;

public class FileCompare {
    public static void main(String[] args) throws IOException {

        Path path1 = Paths.get("C:\\Users\\subha\\OneDrive\\Desktop\\test\\test.ini");
        Path path2 = Paths.get("C:\\Users\\subha\\OneDrive\\Desktop\\test\\test - Copy.ini");

        boolean sameFile = lineByLineComparation(path1, path2);
        //byteByByteComparation(path1, path2);
        //simpleComparation(path1, path2);

    }

    private static void simpleComparation(Path path1, Path path2) throws IOException {
        File file1 = path1.toFile();
        File file2 = path2.toFile();

        boolean isEqual = FileUtils.contentEquals(file1, file2);
        if (isEqual) {
            System.out.println("Files are identical");
        } else {
            System.out.println("Files are different");
        }
    }

    private static void byteByByteComparation(Path path1, Path path2) throws IOException {
        try (BufferedInputStream fis1 = new BufferedInputStream(new FileInputStream(path1.toFile()));
             BufferedInputStream fis2 = new BufferedInputStream(new FileInputStream(path2.toFile()))) {

            int ch;
            long pos = 1;
            boolean areEqual = true;

            while ((ch = fis1.read()) != -1) {
                if (ch != fis2.read()) {
                    areEqual = false;
                    System.out.println("Files differ at byte position " + pos);
                    break;
                }
                pos++;
            }

            if (areEqual && fis2.read() == -1) {
                System.out.println("Files are identical");
            } else if (areEqual) {
                System.out.println("Files differ at byte position " + pos);
            }
        }
    }

    private static boolean lineByLineComparation(Path path1, Path path2) throws IOException {

        boolean identical = false;
        try (BufferedReader reader1 = new BufferedReader(new FileReader(path1.toFile()));
             BufferedReader reader2 = new BufferedReader(new FileReader(path2.toFile()))) {

            String line1, line2;
            boolean areEqual = true;
            int lineNum = 1;

            while ((line1 = reader1.readLine()) != null) {
                line2 = reader2.readLine();
                if (line2 == null || !line1.equals(line2)) {
                    areEqual = false;
                    System.out.println("Files differ at line " + lineNum);
                    System.out.println("File1: " + line1);
                    System.out.println("File2: " + line2);
                    break;
                }
                lineNum++;
            }

            if (areEqual && reader2.readLine() == null) {
                System.out.println("Files are identical");
                identical = true;
            } else if (areEqual) {
                System.out.println("Files differ at line " + lineNum);
                identical = false;
            }
        }
        return identical;
    }
}
