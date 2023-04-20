using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestPowerInstallation.Models;

namespace TestPowerInstallation.Domain.PowerReadIntervalHelpers
{
    internal class AddPowerInterval
    {
        private readonly List<PowerInstallation> _powerInstallations;
        private readonly ElHubContext _context;

        public AddPowerInterval(ElHubContext context, List<PowerInstallation> powerInstallations)
        {
            _context = context;
            _powerInstallations = powerInstallations;
        }

        public void AddPowerIntervalToPowerInstallation(DateTime startDateTime, DateTime endDateTime)
        {
            Random rand = new Random();
            foreach (var powerInstallation in _powerInstallations)
            {
                powerInstallation.PowerReadIntervals.Add(new PowerReadInterval
                {
                    PowerReadIntervalStart = DateTime.Parse(startDateTime.ToUniversalTime().ToString()),
                    PowerReadIntervalEnd = DateTime.Parse(endDateTime.ToUniversalTime().ToString()),
                    PowerInKilowatts = rand.Next(1000),
                });

            }
            
            _context.SaveChanges();
        }
    }
}
