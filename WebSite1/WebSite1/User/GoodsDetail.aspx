<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GoodsDetail.aspx.cs" Inherits="User_GoodsDetail" %>

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
        .auto-style5 {
            width: 50%;
        }
        .auto-style6 {
            width: 100%;
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
                
                <table class="auto-style5">
                    <tr>
                        <td rowspan="5">
                            <asp:Image ID="Image1" runat="server" />
                        </td>
                        <td>商品名：<asp:Label ID="lblGoodsName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>价格：<asp:Label ID="lblPrice" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>商家：<asp:Label ID="lblKeeperName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>购买数量：<asp:TextBox ID="txtNum" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnSubmit" runat="server" Text="加入购物车" OnClick="btnSubmit_Click" />&nbsp;
                            <asp:Button ID="btnBack" runat="server" Text="返回" OnClick="btnBack_Click" />
                        </td>
                    </tr>
                </table>
                
                <br />
                
                <table class="auto-style6">
                    <tr>
                        <td>
                            <asp:Label ID="lblDetail" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                
            </div>
        </div>
    </form>
</body>
</html>
