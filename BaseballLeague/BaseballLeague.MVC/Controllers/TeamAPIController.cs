﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BaseballLeague.BLL;
using BaseballLeague.Models;

namespace BaseballLeague.MVC.Controllers
{
    public class TeamAPIController : ApiController
    {
        #region Team Index Page

        // Used for building table of all active teams
        [HttpGet]
        [ActionName("GetAllTeams")]
        public List<Team> GetAllTeams()
        {
            var ops = new BaseballBLL();
            return ops.GetTeams();
        }

        // Used for building dropdown list of leagues in New Team modal
        [HttpGet]
        [ActionName("GetLeagueDropDown")]
        public List<League> GetLeagueDropDown()
        {
            var ops = new BaseballBLL();

            return ops.GetLeagueDropDown(); 
        }

        // Used for adding new team to list of teams
        [HttpPost]
        [ActionName("PostNewTeam")]
        public void PostNewTeam(Team NewTeam)
        {
            var ops = new BaseballBLL();
            ops.AddTeam(NewTeam);
        }

        #endregion

        #region Specific Team Page

        // Used for building table of all players on a specific team.
        [HttpGet]
        [ActionName("GetFullRoster")]
        public List<Player> GetFullRoster(int TeamID)
        {
            var ops = new BaseballBLL();
            return ops.GetTeamRoster(TeamID);
        }

        #endregion

        #region Release Player Modal

        // Used for releasing a signed player into Free Agent
        [HttpPut]
        [ActionName("ReleasePlayer")]
        public void PutReleasePlayer(int PlayerID)
        {
            var ops = new BaseballBLL();

            ops.ReleasePlayer(PlayerID);
        }

        #endregion

        #region Sign Free Agent Modal

        // Used for building table of available Free Agents in Free Agent Modal
        [HttpGet]
        [ActionName("GetFreeAgents")]
        public List<Player> GetFreeAgents()
        {
            var ops = new BaseballBLL();

            return ops.GetFreeAgents();
        }


        // Used for acquiring a Free Agent onto specific team.
        [HttpPut]
        [ActionName("SignFreeAgent")]
        public void PutSignFreeAgent(int TeamID, int PlayerID)
        {
            var ops = new BaseballBLL();

            ops.TradePlayer(PlayerID, TeamID); 
        }

        #endregion

        #region Trade Player Modal

        // Used for building teams dropdown list for Trade Player Modal
        [HttpGet]
        [ActionName("GetTeamsDropDown")]
        public List<Team> GetTeamsDropDown()
        {
            var ops = new BaseballBLL();

            return ops.GetTeamDropDown();
        }

        // Used for trading player on team roster to another team
        [HttpPut]
        [ActionName("TradePlayerToAnotherTeam")]
        public void TradePlayerToAnotherTeam(int PlayerID, int TeamID)
        {
            var ops = new BaseballBLL();

            ops.TradePlayer(PlayerID, TeamID);

        }

        #endregion
    }

}
