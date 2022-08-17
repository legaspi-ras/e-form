<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="connection._Default" %>


        <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

            <h2> List of e-Forms </h2>  <br />
            <h5> To Download the editable form, view the selected e-form and click download button</h5>


    <br />
            
            <table style="width: 100%;">
                <tr>
                    <td>

                         <div >

            <asp:Label ID="lblsearch" runat="server" Text="Form Control Number : "></asp:Label>
            <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnsearch" runat="server" Text="Search" />

            <asp:GridView   ID="gvfiles" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                            OnPageIndexChanging="OnPaging" >
                <Columns>
                    <%--<asp:BoundField DataField="departmentArea" HeaderText="Department Area" ItemStyle-Width="150" >
                            <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>--%>
                    <asp:BoundField DataField="formControlnum" HeaderText="Form Control #" ItemStyle-Width="150" >
                            <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="formTitle" HeaderText="Form Title" ItemStyle-Width="150" >
                            <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <%--<asp:BoundField DataField="applicableSpecs" HeaderText="Applicable Specification" ItemStyle-Width="150" >
                            <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="revisionNum" HeaderText="Revision" ItemStyle-Width="150" >
                            <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="revisionDate" HeaderText="Revition Date" ItemStyle-Width="150" DataFormatString="{0:d}" HtmlEncode="False" HtmlEncodeFormatString="False" >
                            <ItemStyle Width="150px"></ItemStyle>
                    </asp:BoundField>--%>
                    <asp:ButtonField ButtonType="Button" CommandName="Select" Text="View" HeaderText="Action" />
                </Columns>
            </asp:GridView>

        </div>

                    </td>
                    <td>

                        <asp:HyperLink ID="HyperLink1" runat="server">Your selected pdf file will appear here.</asp:HyperLink>


                    </td>
                    <td>&nbsp;</td>
                </tr>
              
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

       

        <div>

        
        <br />
   

       <%-- <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>


        <br />--%>
        <br />

        </div>

</asp:Content>
