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
        private readonly PowerInstallation _powerInstallation;
        private readonly ElHubContext _context;

        public AddPowerInterval(ElHubContext context, PowerInstallation powerInstallation)
        {
            _context = context;
            _powerInstallation = powerInstallation;
        }

        public void AddPowerIntervalToPowerInstallation(DateTime startDateTime, DateTime endDateTime)
        {
            Random rand = new Random();
            _powerInstallation.PowerReadIntervals.Add(new PowerReadInterval
            {
                PowerInstallationId = _powerInstallation.Id,
                PowerReadIntervalStart = DateTime.Parse(startDateTime.ToUniversalTime().ToString()),
                PowerReadIntervalEnd = DateTime.Parse(endDateTime.ToUniversalTime().ToString()),
                PowerInKilowatts = rand.Next(1000),
            });
            _context.SaveChanges();
        }
    }
}
