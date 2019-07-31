using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleProject.maintenance
{
    public partial class codeBehindPractice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        static string DatabaseConnectionString = ConfigurationManager.ConnectionStrings["ConnectToPoweredPik"].ConnectionString;



        protected void SendScanCartID(object sender, EventArgs args)
        {

            using (SqlConnection con = new SqlConnection(DatabaseConnectionString))
            {
                SqlCommand cmd = new SqlCommand("{select Cart_Setup from cart_header where cart_id = ?}", con);
                SqlParameter CartID = cmd.Parameters.Add("@Ccart_id", SqlDbType.Char);
                cmd.Connection.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {

                    while (reader.Read())
                    {

                        if (reader[1].ToString() != "S")
                        {
                            NewCartPanel.Style.Remove("display");
                        }
                        else
                        {
                            NewCartPanel.Style.Add("display", "none");
                        }

                    }

                    cmd.Connection.Close();
                }


            }

        }
    }
}