<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="User_HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            background-color:rgb(208,224,235);
            text-align:center;
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
        #menuUrl{
            margin:5%;
            width:90%;
            height:95%;
            background-color:#99CCFF;
        }
        .auto-style5 {
            height:30%;
            width: 100%;
        }
        #menuUrl td{
            text-align:center;
        }
        #manage{
            text-align:center;
            position:relative;
            float:right;
            height:60%;
            width:80%;
            background-color:rgb(255,252,241);
        }
        .auto-style6 {
            width:450px;
            height:398px;
            position:absolute;
            left:30%;
            top:5%;
        }
        .auto-style8 {
            text-align:right;
            width: 214px;
            height: 36px;
        }
        .auto-style12 {
            text-align:left;
            width: 226px;
            height: 36px;
        }
        .auto-style13 {
            text-align: center;
            height: 37px;
        }
        .auto-style14 {
            height: 30px;
        }
        .auto-style19 {
            text-align: right;
            width: 214px;
            height: 37px;
        }
        .auto-style20 {
            text-align: left;
            width: 226px;
            height: 37px;
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
            <div id="menu" style="float:left;height:60%;width:20%;background-color:#4D87D6;">
                <div id="menuUrl">

                    <table class="auto-style5">
                        <tr>
                            <td style="background-color:white; font-size:medium;font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;font-weight:bold;">我的</td>
                        </tr>
                        <tr>
                            <td>

                                <asp:HyperLink ID="LinkUser" runat="server" NavigateUrl="~/User/HomePage.aspx">个人信息</asp:HyperLink>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="LinkShopkeeper" runat="server" NavigateUrl="~/User/CartShop.aspx">购物车</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/User/MyOrder.aspx">我的订单</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="Exit" runat="server" NavigateUrl="~/Login.aspx">退出</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div id="manage">
                <table class="auto-style6">
                    <tr>
                        <td colspan="2" style="text-align:center;" class="auto-style14"><strong>个人信息</strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style8">用户名：</td>
                        <td class="auto-style12">
                            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8">密码：</td>
                        <td class="auto-style12">
                            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8">姓名：</td>
                        <td class="auto-style12">
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8">性别：</td>
                        <td class="auto-style12">
                            <asp:DropDownList ID="drop" runat="server">
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8">收货地址：</td>
                        <td class="auto-style12">
                            <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8">电话：</td>
                        <td class="auto-style12">
                            <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style19">邮箱：</td>
                        <td class="auto-style20">
                            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style19">密保问题1：<asp:Label ID="lblQ1" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style20">
                            <asp:TextBox ID="txtA1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style19">密保问题2：<asp:Label ID="lblQ2" runat="server"></asp:Label>
                        </td>
                        <td class="auto-style20">
                            <asp:TextBox ID="txtA2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style13" colspan="2">
                            <asp:Button ID="btnAlter" runat="server" Text="修改信息" OnClick="btnAlter_Click" />
                        </td>
                    </tr>
                </table>

                <br /><br />
            </div>

        </div>
    </form>
</body>
</html>
