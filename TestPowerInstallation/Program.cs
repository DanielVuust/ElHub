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
            List<PowerInstallation> powerInstallation = context.PowerInstallations.Where(x => x.Owners != null).ToList();

            context.SaveChanges();
            PowerInstallationManager powerInstallationManager = new(context, powerInstallation);
            Console.WriteLine("Starting2");

            powerInstallationManager.StartCreatingPowerData();
            Console.Read();
        }
    }
}