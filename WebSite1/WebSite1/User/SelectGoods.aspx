<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SelectGoods.aspx.cs" Inherits="User_SelectGoods" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align:center;
            background-color:rgb(208,224,235);
            height:100%;
            width: 100%;
        }
        .auto-style2 {
            width: 20%;
            height: 28px;
        }
        .auto-style3 {
            width: 40%;
            height: 28px;
        }
        .auto-style4 {
            height: 28px;
        }
    </style>
</head>
<body style="margin:0;">
    <form id="form1" runat="server">
        <div style="height:100%;width:100%;position:absolute;">
            <div id="TopLogo" style="height:35%;width:100%;">  
                <asp:Image ID="img" runat="server" Height="100%" Width="100%" ImageUrl="~/Image/Login/welcome.jpg" />
            </div>
            <div id="navigate" style="height:5%;width:100%;">

                <table class="auto-style1">
                    <tr>
                        <td style="color:rgb(242,46,0)" class="auto-style2">
                           你好，<strong><asp:Label ID="lblName" runat="server"></asp:Label></strong> ! &nbsp;</td>
                        <td class="auto-style3">
                            <asp:HyperLink ID="LinkGoods" runat="server"  Font-Bold="true" NavigateUrl="~/User/SelectGoods.aspx">商品页</asp:HyperLink>
                        </td>
                        <td class="auto-style4">
                            <asp:HyperLink ID="LinkHome" runat="server" Font-Bold="true" NavigateUrl="~/User/HomePage.aspx">个人首页</asp:HyperLink>
                        </td>
                    </tr>
                </table>

            </div>
            
            <div id="Goods" style="height:60%;width:80%;left:15%;position:absolute;">
                <br />
                <ul style="list-style:none; margin:0; padding:0;">

                    <%
                        MyShoppingWebDataContext db = new MyShoppingWebDataContext();
                        var goods2 = db.Goods.Where(m => m.status!= 0);
                        List<Goods> l = goods2.ToList();
                        for(int i = 0; i < l.Count(); i++)
                        {
                            string s = l[i].Img;
                            string sr = s.Replace("~", "");
                            %>
                    <li style="float:left; text-align:center; height:180px; width:250px; border:#DEDEDE solid 1px; margin:10px 10px 10px 0;"><br /><a href="GoodsDetail.aspx?id=<%=l[i].Id%>"><img width="100" src="<%=sr %>" /><br /><%=l[i].Title%><br />价格：<%=l[i].Price%></a></li>
                       <% }%>
                </ul>
                
            </div>
        </div>
    </form>
</body>
</html>
