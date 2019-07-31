using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleProject.maintenance
{
    public partial class CartMaintenance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HeaderGridview.DataBind();
            DetailDS.SelectParameters["Cart_ID"].DefaultValue = FocusedCartID();
            DetailGridview.DataBind();
        }

        protected void DetailGridview_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            DetailDS.SelectParameters["Cart_ID"].DefaultValue = FocusedCartID();
            DetailGridview.DataBind();
        }

        private string FocusedCartID()
        {
            if (HeaderGridview.VisibleRowCount > 0 && HeaderGridview.FocusedRowIndex > -1)
            {
                return HeaderGridview.GetRowValues(HeaderGridview.FocusedRowIndex, "Cart_ID").ToString();
            }
            else
            {
                return "";
            }
        }

        protected void CartCleanUp(object sender, EventArgs e)
        {
            string CartID = HeaderGridview.GetRowValues(HeaderGridview.FocusedRowIndex, "Cart_ID").ToString();
            string responseData = cleanUpCartTask(CartID).Result;
           

            HeaderGridview.DataBind();
            DetailGridview.DataBind();

            notificationPopup.Text = $"Web Response:'{responseData}";
            notificationPopup.ShowOnPageLoad = true;

        }

        public async Task<String> cleanUpCartTask(string cartId)
        {
            string responseData = "";
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri($"http://{HttpContext.Current.Request.Url.Host}/");

                StringContent content = new StringContent($"APPNAME=PoweredPIKWebServer&PRGNAME=CartCleanup&ARGUMENTS=-A{cartId}{','}");
                // HTTP POST
                HttpResponseMessage response = await client.PostAsync(GlobalVariables.MagicVersion, content).ConfigureAwait(false);
                if (response.IsSuccessStatusCode)
                {
                    responseData = await response.Content.ReadAsStringAsync().ConfigureAwait(false);
                }
                else
                {
                    responseData = "Failure Callout to ISAPI returned " + response.StatusCode;

                }
            }
            return responseData;
        }

        protected void RemoveToteFromCart(object sender, EventArgs e)
        {
            string CartID = HeaderGridview.GetRowValues(HeaderGridview.FocusedRowIndex, "Cart_ID").ToString();
            string ToteNumber = DetailGridview.GetRowValues(DetailGridview.FocusedRowIndex, "Tote_Number").ToString();
            string responseData = ISAPICalloutUtilities.RemoveToteTask(CartID, ToteNumber).Result;


            DetailGridview.FocusedRowIndex = 0;
            DetailGridview.DataBind();

            notificationPopup.Text = $"Web Response:'{responseData}";
            notificationPopup.ShowOnPageLoad = true;

        }
    }
}