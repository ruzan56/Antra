using System;

public class Myclass
{
    static public void Main()
    {
        Console.WriteLine("Enter number of centuries:");
        long centuries = Convert.ToInt64(Console.ReadLine());

        long years = centuries * 100;
        long days = years * 365;
        long hours = days * 24;
        long minutes = hours * 60;
        long seconds = minutes * 60;
        long milliseconds = seconds * 1000;
        long microseconds = milliseconds * 1000;
        long nanoseconds = microseconds * 1000;

        Console.Write(centuries + " centuries = ");
        Console.Write(years + " years = ");
        Console.Write(days + " days = ");
        Console.Write(hours + " hours = ");
        Console.Write(minutes + " minutes = ");
        Console.Write(seconds + " seconds = ");
        Console.Write(milliseconds + " milliseconds = ");
        Console.Write(microseconds + " microseconds = ");
        Console.Write(nanoseconds + " nanoseconds ");
    }
}
