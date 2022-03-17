using System;
class Game
{
    static void Main(string[] args)
    {


        int returnValue = new Random().Next(3) + 1;
        bool isCorrect = false;



        
        while (!isCorrect)
        {
            Console.WriteLine("I am thinking of a number between 1-3.  Can you guess what it is?");
            int Guess = Convert.ToInt32(Console.ReadLine());
            if (Guess < 1 || Guess > 3)
            {
                Console.WriteLine("Guess is out of range!");
                
            }
            if (Guess < returnValue)
            {
                Console.WriteLine("No, the number I am thinking of is higher than " + Guess + ". Can you guess what it is?");
            }
             else if (Guess > returnValue)
            {
                Console.WriteLine("No, the number I am thinking of is less than " + Guess + ". Can you guess what it is?");

            }
             else if (Guess == returnValue)
            {
                Console.WriteLine("Well done! The answer was " + returnValue);
                Console.ReadLine();
                isCorrect = true;
            }
        }
    }
}
