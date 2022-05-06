using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMDB.Models;

namespace IMDB.Controllers
{
    public class AccountController : Controller
    {
        SqlConnection con = new SqlConnection();
        SqlCommand com = new SqlCommand();
        SqlDataReader dr;
        // GET: Account
         [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        void connectionString ()
        {
            con.ConnectionString = "data source =DESKTOP-PB2VU1H; database = IMDB; integrated security = SSPI;";
        }
        [HttpPost]
        public ActionResult Verify(Account acc)
        {
            connectionString();
            con.Open();
            com.Connection = con;
            com.CommandText = "select * from Admins where email = '" + acc.Email + "' and password '" + acc.Password + "' ";
            dr = com.ExecuteReader();
            if (dr.Read())
            {
                con.Close();
                return View();
            }

            else
            {
                con.Close();
                return View();
            }

            
        }

    }
}