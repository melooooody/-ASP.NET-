<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FindPassword.aspx.cs" Inherits="FindPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align:center;
            width: 50%;
        }
        .auto-style2 {
            height: 24px;
        }
        .auto-style3 {
            width: 60%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">用户角色：</td>
                    <td class="auto-style2">
                        <asp:RadioButton ID="rbShopKeeper" runat="server" Checked="true" GroupName="Grop" Text="商家" />
                        <asp:RadioButton ID="rbUser" runat="server" GroupName="Grop" Text="购买者" />
                    </td>
                </tr>
                <tr>
                    <td>用户名：</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="txtOK" runat="server" Text="查询" OnClick="txtOK_Click" />
                    </td>
                </tr>
            </table>
            <asp:Panel ID="Panel" runat="server">
                <table class="auto-style3">
                    <tr>
                        <td>问题1：<asp:Label ID="lblQ1" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtA1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>问题2：<asp:Label ID="lblQ2" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtA2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>新密码：</td>
                        <td>
                            <asp:TextBox ID="txtNewPassword" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">确认密码：</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtCheck" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnSubmit" runat="server" Text="提交" OnClick="btnSubmit_Click" />
                        </td>
                    </tr>
                </table>  
            </asp:Panel>
        </div>
    </form>
</body>
</html>
