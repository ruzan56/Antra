//Playing with Console App
using System;
public class Program
{
public static void Main()
    {
        Console.Write("Your favorite color ");
        string color = Console.ReadLine();
        Console.Write("Your sign ");
        string sign  = Console.ReadLine();
        Console.Write("street address number ");
        int number  = int.Parse(Console.ReadLine());
        Console.WriteLine("Your superhero name is ", color, sign, number);

    }
        }
