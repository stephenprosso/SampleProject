using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;

namespace SampleProject
{
    public class ClassOfFunctionsThatCanBeCalledFromOtherPages
    {
        //public static async Task<String> RemoveToteTask(string cartId, string toteNumber)
        //{
        //    string responseData = "";
        //    using (var client = new HttpClient())
        //    {
        //        client.BaseAddress = new Uri($"http://{HttpContext.Current.Request.Url.Host}/");
        //        //add using statements 
        //        StringContent content = new StringContent($"APPNAME=PoweredPIKWebServer&PRGNAME=<PRM>&ARGUMENTS=-A{cartId}{','}" + "-A" + toteNumber.ToUpper());
        //        // HTTP POST
        //        HttpResponseMessage response = await client.PostAsync(GlobalVariables.MagicVersion, content).ConfigureAwait(false);
        //        if (response.IsSuccessStatusCode)
        //        {
        //            responseData = await response.Content.ReadAsStringAsync().ConfigureAwait(false);
        //        }
        //        else
        //        {
        //            responseData = "Failure Callout to ISAPI returned " + response.StatusCode;
        //        }
        //    }
        //    return responseData;
        //}
    }
}