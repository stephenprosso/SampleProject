using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleProject.maintenance
{
    public partial class MasterDeatailGridViews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HeaderGridview.DataBind();
            DetailDS.SelectParameters["Location"].DefaultValue = FocusedLocation();
            DetailGridview.DataBind();
        }

        protected void DetailGridview_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            DetailDS.SelectParameters["Location"].DefaultValue = FocusedLocation();
            DetailGridview.DataBind();
        }

        private string FocusedLocation()
        {
            if (HeaderGridview.VisibleRowCount > 0 && HeaderGridview.FocusedRowIndex > -1)
            {
                return HeaderGridview.GetRowValues(HeaderGridview.FocusedRowIndex, "Location").ToString();
            }
            else
            {
                return "";
            }
        }

        protected void ASPxGridView1_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["seq_#"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
    }
}