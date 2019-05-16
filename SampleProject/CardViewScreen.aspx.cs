using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleProject
{
    public partial class CardViewScreen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (OdbcConnection con = new OdbcConnection(ConfigurationManager.ConnectionStrings["ConnectToAgron"].ConnectionString))
            {
                OdbcCommand cmd = new OdbcCommand("update cart_detail set tote_number = ? where cart_id = ? and Light_Position = ?", con);

                cmd.Parameters.Add("@Tote_Number", OdbcType.Char).Value = toteTB.Value;
                cmd.Parameters.Add("@Cart_ID", OdbcType.Char).Value = FocusedCard();
                cmd.Parameters.Add("@Light_Position", OdbcType.Char).Value = FocusedLightPosition();

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }
            ASPxCardView1.DataBind();
            toteTB.Text = String.Empty;
            toteTB.Focus();

        }
        private string FocusedLightPosition()
        {
            if (ASPxCardView1.VisibleCardCount > 0 && ASPxCardView1.VisibleCardCount > -1)
            {
                return ASPxCardView1.GetCardValues(ASPxCardView1.FocusedCardIndex, "Light_Position").ToString();
            }
            else
            {
                return "";
            }
        }
        private string FocusedCard()
        {
            if (ASPxCardView1.VisibleCardCount > 0 && ASPxCardView1.VisibleCardCount > -1)
            {
                return ASPxCardView1.GetCardValues(ASPxCardView1.FocusedCardIndex, "Cart_ID").ToString();
            }
            else
            {
                return "";
            }
        }
    }
}