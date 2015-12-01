using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BaseballLeague.Data;
using BaseballLeague.Models;
using NUnit.Framework;


namespace BaseballLeague.Tests
{
    [TestFixture]
    public class RepositoryTests
    {

        [TestCase(1,3)]
        [TestCase(1,2)]
        public void TradePlayerTest(int playerID, int tradeTeamId)
        {
            var repo = new Update();
            repo.TradePlayer(playerID, tradeTeamId);

            var readRepo = new Read();
            var players = readRepo.GetTeamRoster(tradeTeamId);
            var player = players.FirstOrDefault(p => p.PlayerID == playerID);           
            Assert.AreEqual(player.PlayerID, playerID);

        }

        [TestCase(1)]
        public void ReleasePlayerTest(int playerID)
        {
            //Release Player to Free Agency
            var repo = new Update();
            repo.ReleasePlayer(playerID);

            //Get Free Agency players and check for released player
            var readRepo = new Read();
            var players = readRepo.GetFreeAgents();
            var player = players.FirstOrDefault(p => p.PlayerID == playerID);
            Assert.AreEqual(player.PlayerID, playerID);

        }

        [Test]
        public void AddAndDeletePlayerTest()
        {
            var player = new Player();
            player.FirstName = "TestFirstName";
            player.LastName = "TestLastName";
            player.JerseyNumber = 99;
            player.TeamID = 1;
            player.LastYearBA = 0;
            player.YearsPlayed = 3;
            player.PrimaryPositionID = 1;
            player.SecondaryPositionID = 2; 

            //Add new player to Team 1
            var repo = new Create();
            repo.AddPlayer(player);

            //Get team roster and verify new player was added
            var readRepo = new Read();
            var players = readRepo.GetTeamRoster(1);
            var playerCount = players.Count;
            var newPlayer = players.FirstOrDefault(p => p.JerseyNumber == player.JerseyNumber);

            //Assert player added is on the roster
            Assert.AreEqual(newPlayer.JerseyNumber, player.JerseyNumber);

            
            //Delete Player from database
            var deleteRepo = new Delete();
            deleteRepo.DeletePlayer(newPlayer.PlayerID.Value);

            //Get count of players on roster after delete
            var playerCountAfterDelete = readRepo.GetTeamRoster(1).Count;

            //Assert player count reduced after player deleted
            Assert.AreEqual(playerCount - 1, playerCountAfterDelete);
        }

        [Test]
        public void TestNonFreeAgentList()
        {
            var repo = new Read();
            var players = repo.GetNonFreeAgentPlayers();

            //Check for free agents
            var freeAgents= players.Where(p => p.TeamID == 0).ToList();
            
            Assert.AreEqual(0,freeAgents.Count);
        }

        [Test]
        public void TestFreeAgentList()
        {
            var repo = new Read();
            var players = repo.GetFreeAgents();
            
            //Check for players assigned to teams
            var nonFreeAgents = players.Where(p => p.TeamID != 0).ToList();

            Assert.AreEqual(0, nonFreeAgents.Count);
        }
    }
}
