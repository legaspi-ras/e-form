<%@ Page Language="vb"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm6.aspx.vb" Inherits="connection.WebForm6" %>

 <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
       
      <h2>Submission of file for approval</h2>

     <div>

           <%-- <td></td>
                      <td><asp:Button ID="send" Text="Send" runat="server" OnClick = "SendEmail1" /></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td><asp:Button ID="Button1" Text="concat" runat="server" OnClick = "SendEmail1" /></td>
                </tr>
            </table>--%><%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>                     <%-- <td></td>
                      <td><asp:Button ID="send" Text="Send" runat="server" OnClick = "SendEmail1" /></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td><asp:Button ID="Button1" Text="concat" runat="server" OnClick = "SendEmail1" /></td>
                </tr>
            </table>--%>

            
            <table style="width: 100%;">
                <tr>
                    <td style="width: 691px">
                        &nbsp;<asp:Label ID="Label6" runat="server" Text="Requestor Employee number :"></asp:Label>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style1" style="width: 691px">&nbsp;<asp:TextBox ID="txtEmpnum" runat="server" Width="459px"></asp:TextBox>&nbsp;&nbsp;
                        </td>
                </tr>
                <tr>
                    <td style="width: 691px">
                        &nbsp;<asp:Label ID="Label1" runat="server" Text="Requestor Full Name :"></asp:Label>
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style1" style="width: 691px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblRequestor" runat="server" Text=" - "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 691px">
                        &nbsp;<asp:Label ID="Label11" runat="server" Text="Requestor Department :"></asp:Label>
                    </td>                   
                </tr>
                <tr>
                     <td class="auto-style1" style="width: 691px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Label ID="lblRequestordept" runat="server" Text=" - "></asp:Label>
                     </td>
                </tr>
                 <tr>
                    <td style="width: 691px">
                        &nbsp;<asp:Label ID="Label14" runat="server" Text="Approver Full Name :"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="width: 691px">&nbsp;<asp:TextBox ID="txtApprovername" runat="server" Width="459px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 691px">
                        &nbsp;<asp:Label ID="Label9" runat="server" Text="Approver/s email address :"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="width: 691px">&nbsp;<asp:TextBox ID="txtApproveremail" runat="server" Width="459px"></asp:TextBox> 

                        <br />

                    </td>
                </tr>
                
                <tr>
                    <td>
                          <asp:Button ID="btnAdd" runat="server" Text="Add" Width="70px" />
                          <asp:Button ID="btnRemove" runat="server" Text="remove" /> 
                          <asp:Button ID="btnClearall" runat="server" Text="clear all" />
                          <br />
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1" style="width: 691px">&nbsp;<asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple" Width="469px"></asp:ListBox></td>
                    <td>
                        <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>

                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1" style="width: 691px">
                        <asp:Label ID="lblFilename" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                    <td>
                       
                        <asp:Button ID="Button6" runat="server" Text="Button" Visible="False" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <hr />

            Search and attached the document needed for approval/s<br />

            <hr />
            <table style="width: 100%;">
                <tr>
                     <td style="width: 243px">&nbsp;<asp:Label ID="Label10" runat="server" Text="Form Control Number"></asp:Label></td>
                     <td>&nbsp;<asp:TextBox ID="txtSearch" runat="server" Width="559px"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp; 
                      </td>

                </tr>
                <tr>
                    <td style="width: 243px">&nbsp;<asp:Label ID="Label2" runat="server" Text="Department :"></asp:Label></td>
                    <td>&nbsp;<asp:Label ID="lblDepartment" runat="server" Text="-"></asp:Label>
                    </td>
               </tr>
                <tr>
                    <td style="width: 243px">&nbsp;<asp:Label ID="Label3" runat="server" Text="Form Control Number :"></asp:Label></td>
                    <td>&nbsp;<asp:Label ID="lblFormctrlnum" runat="server" Text="-"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 243px">&nbsp;<asp:Label ID="Label4" runat="server" Text="Form Title :"></asp:Label></td>
                    <td>&nbsp;<asp:Label ID="lblFormtitle" runat="server" Text="-"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 243px">&nbsp;<asp:Label ID="Label5" runat="server" Text="Applicable Specifications :"></asp:Label></td>
                    <td>&nbsp;<asp:TextBox ID="txtasn" runat="server" Enabled="False" Width="553px"></asp:TextBox></td>
                </tr>
                <tr>
                     <td style="width: 243px; height: 42px;">&nbsp;<asp:Label ID="Label8" runat="server" Text="Select File for Upload : "></asp:Label></td>
                    <td style="height: 42px">&nbsp;<asp:FileUpload ID="FileUpload1" runat="server" Enabled="False" Width="398px" /></td>
                </tr>
                <tr>
                    <td style="width: 243px">&nbsp;  </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>




        </div>
        <asp:Label ID="Label12" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="Label13" runat="server" Text="Label" Visible="False"></asp:Label>
        <br />
        <br />
      <asp:Button ID="btnUploadnSend" runat="server" Text="upload and send email" Enabled="False" /> 
        <br />
        <br />
        <asp:Button ID="Button7" runat="server" Text="view for approval" Visible="False" />
</asp:Content>
