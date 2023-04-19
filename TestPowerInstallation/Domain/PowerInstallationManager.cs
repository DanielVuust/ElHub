using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestPowerInstallation.Domain.PowerReadIntervalHelpers;
using TestPowerInstallation.Models;

namespace TestPowerInstallation.Domain
{
    internal class PowerInstallationManager
    {
        private readonly PowerInstallation _powerInstallation;
        private readonly ElHubContext _context;
        private bool _powerCreationStopRequested = false;
        public PowerInstallationManager(ElHubContext context, PowerInstallation powerInstallation)
        {
            _context = context;
            _powerInstallation = powerInstallation;
        }
        public void StartCreatingPowerData()
        {
            AddPowerInterval addPowerInterval = new(_context, _powerInstallation);
            DateTime startDateTime = DateTime.Now;

            while (_powerCreationStopRequested == false)
            {
                Console.WriteLine("Creating power data");
                Thread.Sleep(1000);
                addPowerInterval.AddPowerIntervalToPowerInstallation(startDateTime, DateTime.Now);
                startDateTime = DateTime.Now;
            }

            _powerCreationStopRequested = false;
        }

        public void StopCreatingPowerData()
        {
            _powerCreationStopRequested = true;
        }
    }
}
