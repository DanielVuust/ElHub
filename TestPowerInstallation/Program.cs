using TestPowerInstallation.Domain;
using TestPowerInstallation.Models;

namespace TestPowerInstallation
{
    internal class Program
    {
        static void Main(string[] args)
        {
            ElHubContext context = new();
            Console.WriteLine("Starting");
            PowerInstallation powerInstallation = context.PowerInstallations.FirstOrDefault(x => x.Owners != null);
            if (powerInstallation == null)
            {
                context.PowerInstallations.Add(new PowerInstallation()
                    {
                        Name = "test",
                        Type = "testType",
                        PowerReadIntervals = new List<PowerReadInterval>(),
                    }
                );
            }

            context.SaveChanges();
            PowerInstallationManager powerInstallationManager = new(context, powerInstallation);
            Console.WriteLine("Starting2");

            powerInstallationManager.StartCreatingPowerData();
            Console.Read();
        }
    }
}