using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleProject
{
    public partial class ParseJSONObject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Random json string, No fix number of columns or rows and no fix column name.   
            //string myDynamicJSON = "[{'Member ID':'00012','First Name':'Vicki','Last Name':'Jordan','Registered Email':'vicki.j @tacinc.com.au','Mobile':'03 6332 3800','MailSuburb':'','MailState':'','MailPostcode':'','Engagement':'attended an APNA event in the past and ventured onto our online education portal APNA Online Learning','Group':'Non-member'},{'Member ID':'15072','First Name':'Vicki','Last Name':'Jordan','Registered Email':'vicki.j @tacinc.com.au','Mobile':'03 6332 3800','MailSuburb':'','MailState':'','MailPostcode':'','Engagement':'attended an APNA event in the past and ventured onto our online education portal APNA Online Learning','Group':'Non-member'}]";
            //string myJSON = "[{ 'action': 'Pick', 'Cart': '5', 'Part': 'sku1', 'Location': '01A1', 'batchpos':'batchpos'}]";
            //string myJSON = { "action": "Pick", "Cart": "5", "Part": "sku1", "Location": "01A1", "batchpos":[{"tuff": "ONE", "taco":"TWO", "bandana":"THREE"}]};

            ////Using dynamic keyword with JsonConvert.DeserializeObject, here you need to import Newtonsoft.Json  
            //dynamic myObject = JsonConvert.DeserializeObject(myJSON);

            ////Binding gridview from dynamic object   
            //GridView1.DataSource = myObject;
            //GridView1.DataBind();

            ////Using DataTable with JsonConvert.DeserializeObject, here you need to import using System.Data;  
            //DataTable myObjectDT = JsonConvert.DeserializeObject<DataTable>(myJSON);

            ////Binding gridview from dynamic object   
            //GridView1.DataSource = myObjectDT;
            //GridView1.DataBind();
            Batch batch = new Batch
            {
                // below is hand entered data to populate object batch
                Action = "Pick",
                Cart = "5",
                Part = "sku1",
                Location = "01A1",
                BatchPos = new List<BatchPositions>
                {
                    new BatchPositions {Pos = "1", Order = "ord1", ActualQty = 1, RequestQty = 1,TC=true, Color = 1, BlinkSpeed=0},
                    new BatchPositions {Pos = "2", Order = "ord2", ActualQty = 1, RequestQty = 2,TC=true, Color = 1, BlinkSpeed=0},
                    new BatchPositions {Pos = "3", Order = "ord3", ActualQty = 1, RequestQty = 3,TC=true, Color = 1, BlinkSpeed=0},
                    new BatchPositions {Pos = "4", Order = "ord4", ActualQty = 1, RequestQty = 4,TC=true, Color = 1, BlinkSpeed=0},
                    new BatchPositions {Pos = "5", Order = "ord5", ActualQty = 1, RequestQty = 5,TC=false, Color = 1, BlinkSpeed=0}
                }
            };
            string json = JsonConvert.SerializeObject(batch, Formatting.Indented); // convert batch object into a string
            Console.WriteLine(json); // display the string
            Batch b1 = JsonConvert.DeserializeObject<Batch>(json); // take the just created string and populate object b1

            //Using dynamic keyword with JsonConvert.DeserializeObject, here you need to import Newtonsoft.Json  
            dynamic myObject = JsonConvert.DeserializeObject(json);

            //Binding gridview from dynamic object   
            toteListView.DataSource = myObject;
            toteListView.DataBind();

            //Using DataTable with JsonConvert.DeserializeObject, here you need to import using System.Data;  
            // DataTable myObjectDT = JsonConvert.DeserializeObject<DataTable>(json);

            //Binding gridview from dynamic object   
             ASPxListBox1.DataSource = myObject;

            ASPxListBox1.DataBind();
            

            // display the various fields of the object
            Console.WriteLine("action : " + b1.Action);
            Console.Write(" Cart : " + b1.Cart);
            Console.Write(" Part : " + b1.Part);
            Console.WriteLine(" Locn : " + b1.Location);
            foreach (BatchPositions bp1 in b1.BatchPos)
            {
                // loop through the array batchpos
                Console.Write("pos : " + bp1.Pos);
                Console.Write(" order : " + bp1.Order);
                Console.Write(" request qty : " + bp1.RequestQty);
                Console.Write(" actual qty : " + bp1.ActualQty);
                Console.Write(" TC : " + bp1.TC);
                Console.Write(" Color : " + bp1.Color);
                Console.WriteLine(" BlinkSpeed : " + bp1.BlinkSpeed);
            }
        }
        public class BatchPositions // this is the class to describe the array batchpos below
        {
            public string Pos;
            public string Order;
            public int RequestQty;
            public int ActualQty;
            public bool TC;
            public int Color;
            public int BlinkSpeed;
        }
        public class Batch // this is the class to describe the json elements
        {
            public string Action { get; set; }
            public string Cart { get; set; }
            public string Part { get; set; }
            public string Location { get; set; }
            public IList<BatchPositions> BatchPos { get; set; }
        }
        class JSONSerialize
        {
            static void Main(string[] args)
            {

                
            }
        }
    }


}