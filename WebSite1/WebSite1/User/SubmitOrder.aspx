<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubmitOrder.aspx.cs" Inherits="User_SubmitOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width:450px;
            height:256px;
            position:absolute;
            left:30%;
            top:10%;
        }
        .auto-style26 {
            text-align:center;
            height: 38px;
        }
        .auto-style31 {
            height: 38px;
            text-align: right;
            width: 224px;
        }
        .auto-style32 {
            height: 38px;
            width: 224px;
        }
        .auto-style33 {
            text-align: right;
            height: 39px;
            width: 224px;
        }
        .auto-style34 {
            height: 39px;
            width: 224px;
        }
        .auto-style35 {
            text-align: center;
            height: 39px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height:100%;width:100%;position:absolute;">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style26" colspan="2"><strong>订单信息</strong></td>
                </tr>
                <tr>
                    <td class="auto-style31">用户名：</td>
                    <td class="auto-style32">
                        <asp:Label ID="lblUserName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style31">姓名：</td>
                    <td class="auto-style32">
                        <asp:Label ID="lblName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style33">收货地址：</td>
                    <td class="auto-style34">
                        <asp:Label ID="lblAddress" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style33">电话：</td>
                    <td class="auto-style34">
                        <asp:Label ID="lblPhone" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style33">邮箱：</td>
                    <td class="auto-style34">
                        <asp:Label ID="lblEmail" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style33">商品信息：</td>
                    <td class="auto-style34">
                        <asp:Label ID="lblGoods" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style33">总价：</td>
                    <td class="auto-style34">
                        <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style35" colspan="2">
                        <asp:Button ID="btnOk" runat="server" Text="支付" OnClick="btnOk_Click" />&nbsp;
                        <asp:Button ID="btnBack" runat="server" Text="返回" OnClick="btnBack_Click" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>