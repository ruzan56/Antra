/*using System;
public class Birthday
{
    public static void Main(string[] args)
    {
        Console.WriteLine("Welcome to the Days on Earth Finder!" +
"\nPlease input your birthday(MM/DD/YYY):");
        
        string myBirthday = Console.ReadLine();
        DateTime mB = DateTime.Parse(myBirthday);
        //This line is where the error occurs
        TimeSpan myAge = DateTime.Now.Subtract(mB);
        int Age= (int)myAge.TotalDays;

        Console.WriteLine("You are " + Age  + " days old!");
        Console.ReadLine();

    }
}*/