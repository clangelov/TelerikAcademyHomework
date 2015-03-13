﻿/*
 * Problem 3. Sequence n matrix
 * We are given a matrix of strings of size N x M. Sequences in the matrix we define as sets of several neighbour elements located on the same line, column or diagonal.
 * Write a program that finds the longest sequence of equal strings in the matrix.
 * Example:
 * matrix	        result              matrix	        result
 * ha fi ho hi                          s	qq	s
   fo ha hi xx      ha, ha, ha          pp	pp	s       s, s, s
 * xxx ho ha xx                         pp	qq	s 
*/
using System;
using System.Linq;
class SequenceNMatrix
{
    static readonly int[,] directions = { { 0, 1 }, { 1, 1 }, { -1, 1 }, { 1, 0 } };
    static void Main()
    {
        Console.Write("Enter side N of the matrix: ");
        int sideRow = int.Parse(Console.ReadLine());

        Console.Write("Enter side M of the matrix: ");
        int sideCol = int.Parse(Console.ReadLine());

        string[,] matrix = new string[sideRow, sideCol];

        for (int row = 0; row < sideRow; row++)
        {
            Console.WriteLine("Enter {0} strings separated by space on Row {1}", sideCol, row);
            string input = Console.ReadLine();
            string[] transformation = input.Split(' ');
            for (int col = 0; col < sideCol; col++)
            {
                matrix[row, col] = transformation[col];
            }

        }
        Console.Clear();

        int bestLength = 0;
        string bestElement = string.Empty;

        PrintMatrix(matrix);
        FindLongestSequence(matrix, ref bestElement, ref bestLength);
        PrintResult(bestElement, bestLength);
    }

    static void FindLongestSequence(string[,] matrix, ref string bestElement, ref int bestLength)
    {
        for (int row = 0; row < matrix.GetLongLength(0); row++)
        {
            for (int col = 0; col < matrix.GetLongLength(1); col++)
            {
                int direction = -1;

                while (++direction < 4)
                {
                    int currRow = row + directions[direction, 0];
                    int currCol = col + directions[direction, 1];
                    int currentLength = 1;

                    while (IsTraversable(matrix, row, col, currRow, currCol))
                    {
                        currentLength++;

                        if (currentLength > bestLength)
                        {
                            bestLength = currentLength;
                            bestElement = matrix[row, col];
                        }

                        currRow += directions[direction, 0];
                        currCol += directions[direction, 1];
                    }
                }
            }
        }
    }

    static bool IsTraversable(string[,] matrix, int row, int col, int currRow, int currCol)
    {
        return currRow >= 0 && currRow < matrix.GetLongLength(0) &&
               currCol >= 0 && currCol < matrix.GetLongLength(1) &&
               matrix[currRow, currCol] == matrix[row, col];
    }

    static void PrintMatrix(string[,] matrix)
    {
        Console.WriteLine("\nMatrix:\n");
        for (int row = 0; row < matrix.GetLongLength(0); row++)
        {
            for (int col = 0; col < matrix.GetLongLength(1); col++)
            {
                Console.Write(matrix[row, col] + "\t");
            }
            Console.WriteLine(new string('-', 30));
        }
    }

    static void PrintResult(string bestElement, int bestLength)
    {
        Console.WriteLine("\nResult: {0}({1} times)\n",
            String.Concat(Enumerable.Repeat(bestElement + " ", bestLength)), bestLength);
    }    
}
