using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaseballLeague.Models
{
    public class Player
    {
        public int? PlayerID { get; set; }
        public string Name { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int JerseyNumber { get; set; }
        public int TeamID { get; set; }
        public string TeamName { get; set; }
        public decimal LastYearBA { get; set; }
        public int YearsPlayed { get; set; }
        public int PrimaryPositionID { get; set; }
        public int? SecondaryPositionID { get; set; }
        public string PrimaryPosition { get; set; }
        public string SecondaryPosition { get; set; }
        
    }
}
