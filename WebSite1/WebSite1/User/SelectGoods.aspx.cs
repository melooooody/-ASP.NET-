using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class User_SelectGoods : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "商品列表";
        if (Session["UserName"] == null)
        {
            Session["UserName"] = "";
        }
        lblName.Text = Session["UserName"].ToString();
    }

}