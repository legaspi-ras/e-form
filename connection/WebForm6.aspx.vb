Imports System.Net.Mail
Imports System.IO
Imports MySql.Data.MySqlClient

Public Class WebForm6
    Inherits System.Web.UI.Page

    Dim connection As MySqlConnection
    Dim command As MySqlCommand

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        txtSearch.Attributes.Add("placeholder", "search")
        txtEmpnum.Attributes.Add("placeholder", "search")
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles btnUploadnSend.Click

        '' save yung for approval na pdf sa for approval folder
        Dim savefilename As String
        savefilename = Path.GetFileName(FileUpload1.FileName)

        Dim directory As String
        Dim contentType As String
        contentType = FileUpload1.PostedFile.ContentType

        Dim pdfSavingStatus As String
        pdfSavingStatus = "failed"

        directory = Server.MapPath("~/for_approval/" + savefilename) '' gagawa ng validation para malaman kung tamang ang file name na kailangan i submit lalo na pag mga signatory na ang gagawa

        '  Label6.Text = directory for validation lang ito

        If contentType = "application/pdf" Then ''  <---- check kung PDF file ang document

            If File.Exists(directory) Then '' <---- check kung may kapangalan ng file

                '' delete muna ang lumang file na guston paltan. --------------------------------

                File.Delete(directory)

                ''end of deleteing --------------------------------------------------------------

                '' start saving young edited file -----------------------------------------------

                Using fs As Stream = FileUpload1.PostedFile.InputStream

                    ' save niya sa folder na for approval 
                    FileUpload1.SaveAs(Server.MapPath("~/for_approval/" + savefilename))

                End Using

                pdfSavingStatus = "success"

                ' end -----  upload (saving) pdf file to mysql database

            Else ''  <---- if walang katulad na filename

                Using fs As Stream = FileUpload1.PostedFile.InputStream


                    FileUpload1.SaveAs(Server.MapPath("~/for_approval/" + savefilename))
                    ''  Response.Redirect(Request.Url.AbsoluteUri)

                End Using

                MsgBox("New request has been posted.")
                pdfSavingStatus = "success"

            End If

            ' save sa database tblapprovalrequest saka tblapprover -------------------------------------------------------------------------------

            If pdfSavingStatus = "success" Then

                Dim filename As String
                Dim deptarea As String
                Dim formctrlnum As String
                Dim frmtitle As String
                Dim appspecs As String

                Dim requestor As String
                Dim reqdept As String
                Dim reqdate As String
                Dim approverEmailaddnName() As String
                Dim approverstatus As String



                deptarea = lblDepartment.Text
                formctrlnum = lblFormctrlnum.Text
                frmtitle = lblFormtitle.Text
                appspecs = txtasn.Text

                If appspecs = "" Then

                    appspecs = "NA"

                End If

                filename = Path.GetFileName(FileUpload1.FileName)
                requestor = lblRequestor.Text
                reqdept = lblRequestordept.Text
                reqdate = Today.ToString("yyyy-MM-dd")
                approverstatus = "Pending"

                Label13.Text = filename

                Dim query As String

                connection = New MySqlConnection
                connection.ConnectionString = ("server='localhost'; port='3306'; username='root'; password='powerhouse'; database='eforms'")

                'tblapprovalrequest -------------------------------------------------------------------------------------------------------------

                query = ("INSERT INTO tblapprovalrequest (formControlnum, filename, applicableSpecs, requestorName, requestorDepartment, requestStatus, requestDate) VALUES ('" & formctrlnum & "', '" & savefilename & "', '" & appspecs & "', '" & requestor & "', '" & reqdept & "', '" & approverstatus & "', '" & reqdate & "')")

                command = New MySqlCommand(query, connection)

                Dim reader As MySqlDataReader
                connection.Open()

                reader = command.ExecuteReader()
                reader.Read()

                reader.Close()


                'tblapprover '----------------------------------------------------------------------------------------------------------------

                Dim appemailaddnName As String
                Dim item = ListBox1.Items.Count
                Dim counter As Integer
                counter = 0

                Dim smtp_server As New SmtpClient
                Dim e_mail As New MailMessage()
                smtp_server.UseDefaultCredentials = False
                smtp_server.Credentials = New Net.NetworkCredential("e_form@yahoo.com", "Admin12345!")
                smtp_server.Port = 465
                smtp_server.EnableSsl = True
                smtp_server.Host = "smtp.mail.yahoo.com"

                Dim query1 As String
                Dim reader1 As MySqlDataReader

                Try


                    While item > counter


                        appemailaddnName = ListBox1.Items(counter).ToString

                        approverEmailaddnName = Split(appemailaddnName, ",")


                        query1 = ("INSERT INTO tblapprovers (approverName, emailAddress, formControlnum, approverStatus)VALUES('" & approverEmailaddnName(1) & "', '" & approverEmailaddnName(0) & "', '" & formctrlnum & "', '" & approverstatus & "')")

                        command = New MySqlCommand(query1, connection)

                        reader1 = command.ExecuteReader()
                        reader1.Read()

                        'Label1.Text = ListBox1.Items(counter).ToString

                        'sending email na ito ----- working to --------------------------------------------------------------------------


                        e_mail = New MailMessage()
                        e_mail.From = New MailAddress("legaspi.ras@gmail.com")
                        e_mail.To.Add(approverEmailaddnName(0))
                        e_mail.Subject = "Signature on documents required for approval."
                        e_mail.IsBodyHtml = False
                        e_mail.Body = " Good day Sir/Madam,

                    With due respect, my name Is " + requestor + " from " + reqdept + ". I am writing this email in reference to the form control number: " + formctrlnum + " titiled " + frmtitle + " that needs to be approve and I want to inform you that for further procedure, you are required to submit your e-signature.

                    Therefore, I request you to kindly open this link (dito yung link) from the system to search and access the document named: " + frmtitle + " with form control number: " + formctrlnum + ". 

                    To access the system, please login by entering your username and password.

                    Once you access the system, please view and attached your e-signature. And importantly please, don't forget to logout so that the other approvers can access the system. 

                    It is requested to do the needful at the earliest.

                    Please contact me with any questions or concerns.

                    Thank you and best Regards,.

                    " + requestor + "
                    " + reqdept

                        smtp_server.Send(e_mail)

                        counter = counter + 1
                        reader1.Close()
                    End While

                Catch ex As Exception
                    MsgBox(ex.ToString)

                End Try

            End If

        Else
            '' git hub
            MsgBox("Please select the pdf file for upload.")

        End If

        '' end sending email---------------------------------------------------------------------------------------------------------------------------

        Response.Redirect(Request.Url.AbsoluteUri) '' refesh niya ang webform (ginamit ko para ma clear ang mga textboxes)
        connection.Close()

    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles btnRemove.Click

        Dim item = ListBox1.Items.Count

        If txtApprovername.Text <> "" And txtApproveremail.Text <> "" Then
            If item <> 0 Then
                ListBox1.Items.RemoveAt(ListBox1.SelectedIndex())
            End If
        End If


    End Sub

    Protected Sub Button5_Click(sender As Object, e As EventArgs) Handles btnClearall.Click
        ListBox1.Items.Clear()
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles btnAdd.Click

        Dim item = ListBox1.Items.Count

        If txtApprovername.Text <> "" And txtApproveremail.Text <> "" Then

            ListBox1.Items.Add(txtApproveremail.Text + "," + txtApprovername.Text)
                txtApproveremail.Text = ""
                txtApprovername.Text = ""

        End If

    End Sub

    Protected Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click

        'Dim laman = ListBox1.Items.Count
        'Dim i As Integer
        'Dim approvers As String
        'approvers = ""
        'i = 0

        'While laman > i

        '    approvers = approvers + ListBox1.Items(i).ToString + ","
        '    i = i + 1

        'End While

        'Label12.Text = approvers


        'Dim values As String

        'values = "TechRepublic.com, CNET.com, News.com, Builder.com, GameSpot.com,"

        'Dim sites As String() = Nothing

        'sites = values.Split(",")

        'Dim s As String

        'For Each s In sites
        '    Label12.Text = s

        'Next s

        'Dim testString As String = "Look,at,these!,"
        '' Returns an array containing "Look", "at", and "these!".
        'Dim testArray() As String = Split(testString, ",")

        'Label12.Text = testArray(0) + testArray(1) + testArray(2) + testArray(3)

        'Label13.Text = testArray.Length

        'For Each s As String In testArray

        '    Label13.Text = s + Label13.Text

        'Next

        '' array to listbox na may check box tapos 

        Dim assemblename As String
        Dim holdername() As String
        Dim requestor As String

        assemblename = lblRequestor.Text

        holdername = assemblename.Split(",")

        Dim s As String

        For Each s In holdername

            requestor = s + " " + requestor
            MsgBox(requestor)
        Next s

        Label13.Text = Requestor
    End Sub

    Protected Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click
        Response.Redirect("WebForm8.aspx")
    End Sub

    Private Sub txtSearch_TextChanged(sender As Object, e As EventArgs) Handles txtSearch.TextChanged

        ''  MsgBox("proceed to next step")


        '' display nya yung galing sa search data ------------------------------------------------------------
        Dim query As String

        connection = New MySqlConnection
        connection.ConnectionString = ("server='localhost'; port='3306'; username='root'; password='powerhouse'; database='eforms'")

        query = ("SELECT * FROM tblform_masterlist WHERE formControlnum LIKE '" & txtSearch.Text & "%'") '' REMINDER - BAGO MAG SAVE SA DATABASE IMPORTANTENG NAKA TRIM ANG MGA SPACES PARA WALANG PROBLEMA PAG NAG FETCH NA NG DATA FROM DATABASE

        command = New MySqlCommand(query, connection)
        connection.Open()

        Dim reader As MySqlDataReader
        reader = command.ExecuteReader()
        reader.Read()

        If reader.HasRows Then

            lblDepartment.Text = reader(1)
            lblFormctrlnum.Text = reader(2)
            lblFormtitle.Text = reader(3)
            lblFilename.Text = reader(5)

            btnUploadnSend.Enabled = True

            reader.Close()
            connection.Close()

            txtasn.Enabled = True
            FileUpload1.Enabled = True

        Else
            MsgBox("Sorry, the e-form that your looking for is not available.")
        End If


    End Sub

    Private Sub txtEmpnum_TextChanged(sender As Object, e As EventArgs) Handles txtEmpnum.TextChanged

        Dim query As String

        connection = New MySqlConnection
        connection.ConnectionString = ("server='localhost'; port='3306'; username='root'; password='powerhouse'; database='eforms'")

        query = ("SELECT EMP_NO, EMP_NAME, DEPARTMENT FROM emp_masterlist WHERE EMP_NO = '" & txtEmpnum.Text & "'") '' REMINDER - BAGO MAG SAVE SA DATABASE IMPORTANTENG NAKA TRIM ANG MGA SPACES PARA WALANG PROBLEMA PAG NAG FETCH NA NG DATA FROM DATABASE

        command = New MySqlCommand(query, connection)
        connection.Open()

        Dim reader As MySqlDataReader
        reader = command.ExecuteReader()
        reader.Read()

        If reader.HasRows Then

            lblRequestor.Text = reader(1)
            lblRequestordept.Text = reader(2)

            reader.Close()
            connection.Close()

        Else
            MsgBox("Sorry, employee number doesn't exist.")
        End If

    End Sub
End Class

