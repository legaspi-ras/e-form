<%@ Page Language="vb"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm8.aspx.vb" Inherits="connection.WebForm8" %>


 <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


        <div>

            <h2> For Approval </h2> 

            <table>
                <tr>
                   <td class="auto-style1">&nbsp;  <asp:Label ID="Label6" runat="server" Text="Form Control Number :"></asp:Label></td>
                    <td class="auto-style1">&nbsp;  <asp:TextBox ID="txtSearch" runat="server" Width="1114px"></asp:TextBox></td>
                    <td class="auto-style2">&nbsp; <asp:Button ID="Button1" runat="server" Text="Search" /></td>
                </tr>
               
            </table>


            <table>
                <tr>
                    <td class="auto-style1" style="height: 240px">&nbsp;  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="1133px">
                <Columns>
                    <asp:BoundField DataField="formTitle" HeaderText="formTitle" SortExpression="formTitle" />
                    <asp:BoundField DataField="formControlnum" HeaderText="formControlnum" SortExpression="formControlnum" />
                    <asp:BoundField DataField="applicableSpecs" HeaderText="applicableSpecs" SortExpression="applicableSpecs" />
                    <asp:BoundField DataField="requestorName" HeaderText="requestorName" SortExpression="requestorName" />
                    <asp:BoundField DataField="requestorDepartment" HeaderText="requestorDepartment" SortExpression="requestorDepartment" />
                    <asp:BoundField DataField="requestStatus" HeaderText="requestStatus" SortExpression="requestStatus" />
                    <asp:BoundField DataField="requestDate" DataFormatString="&quot;{0:d}&quot;" HeaderText="requestDate" SortExpression="requestDate" />
                    <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Action" ShowHeader="True" Text="View" />
                </Columns>
            </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:eformsConnectionString %>" ProviderName="<%$ ConnectionStrings:eformsConnectionString.ProviderName %>" SelectCommand="SELECT tblform_masterlist.formTitle, tblapprovalrequest.formControlnum, tblapprovalrequest.filename, tblapprovalrequest.applicableSpecs, tblapprovalrequest.requestorName, tblapprovalrequest.requestorDepartment, tblapprovalrequest.requestStatus, tblapprovalrequest.requestDate FROM tblform_masterlist INNER JOIN tblapprovalrequest ON tblform_masterlist.formControlnum = tblapprovalrequest.formControlnum"></asp:SqlDataSource>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label></td>
                    <td class="auto-style2" style="height: 240px">&nbsp; <asp:HyperLink ID="HyperLink1" runat="server">Your selected pdf file will appear here.</asp:HyperLink></td>
                    <td style="height: 240px"></td>
                </tr>
                <tr>
                    <td class="auto-style1">
        
        <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style2">
        <asp:Button ID="Button2" runat="server" Text="Button" Visible="False" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <p> 
               
                
            </p>

 
        </div>
        
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Visible="False">
            <Columns>
                <asp:BoundField DataField="approverName" HeaderText="Approver Name" SortExpression="approverName" />
                <asp:BoundField DataField="emailAddress" HeaderText="Email Address" SortExpression="emailAddress" />
                <asp:BoundField DataField="approverStatus" HeaderText="Approver Status" SortExpression="approverStatus" />
                <asp:BoundField DataField="approvDate" HeaderText="Approved Date" SortExpression="approvDate" />
                <asp:BoundField DataField="remarks" HeaderText="Remarks" SortExpression="remarks" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:eformsConnectionString %>" ProviderName="<%$ ConnectionStrings:eformsConnectionString.ProviderName %>" SelectCommand="SELECT tblapprovers.approverName, tblapprovers.emailAddress,  tblapprovers.approverStatus, tblapprovers.approvDate,
tblapprovers.remarks
FROM tblmasterlist
INNER JOIN tblapprovers ON tblmasterlist.applicableSpecs = tblapprovers.applicableSpecs 
WHERE tblmasterlist.applicableSpecs  = &quot;TFP07-001&quot;"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" Visible="False">
            <Columns>
                <asp:BoundField DataField="approverName" HeaderText="Approver Name" SortExpression="approverName" />
                <asp:BoundField DataField="emailAddress" HeaderText="Email Address" SortExpression="emailAddress" />
                <asp:TemplateField HeaderText="Approver Status" SortExpression="approverStatus">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("approverStatus") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>Pending</asp:ListItem>
                            <asp:ListItem>Approved</asp:ListItem>
                            <asp:ListItem>Disapproved</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="approvDate" HeaderText="Approved Date" SortExpression="approvDate" />
                <asp:BoundField DataField="remarks" HeaderText="Remarks" SortExpression="remarks" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
</asp:Content>
