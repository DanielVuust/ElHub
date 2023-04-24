using TestPowerInstallation.Domain;
using TestPowerInstallation.Models;

namespace TestPowerInstallation
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Scaffold-DbContext "User ID=postgres;Password={Password};Host=localhost;Port=8090;Database=el_hub;Pooling=true;Connection Lifetime=0;;" Npgsql.EntityFrameworkCore.PostgreSQL -OutputDir Models -Force
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